import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/cache/shared_preferences.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/errors/firebase_auth_error_mapper.dart';
import '../../../../../core/services/firebase_service.dart';
import '../../../domain/entities/auth_entity.dart';
import '../../data_sources/remote/auth_remote_data_source.dart';
import '../../model/auth_model.dart';

bool get isIOSSimulator {
  return Platform.isIOS &&
      Platform.environment.containsKey('SIMULATOR_DEVICE_NAME');
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseService firebaseService;

  AuthRemoteDataSourceImpl(this.firebaseService);

  // ------------------------------------------------------
  // REGISTER
  // ------------------------------------------------------
  @override
  Future<Either<Failures, AuthEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      print("➡ REGISTER…");

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;
      final uid = user.uid;

      final userData = AuthModel(
        id: uid,
        name: name,
        email: email,
        phone: phone,
        profileImage: "",
      );

      await _firestore.collection("users").doc(uid).set(userData.toMap());

      final token = await user.getIdToken(true);

      // -------- FCM TOKEN SAFE MODE --------
      String? fcmToken;

      if (isIOSSimulator) {
        fcmToken = "ios_simulator_token";
      } else {
        try {
          fcmToken = await FirebaseMessaging.instance.getToken();
        } catch (_) {
          // لو الـ FCM وقع لأي سبب → ما نكسرش الـ register
          fcmToken = null;
        }
      }
      // -------------------------------------

      await SharedPrefHelper.setString("auth_token", token!);
      await SharedPrefHelper.setString("user_name", name);
      await SharedPrefHelper.setString("user_email", email);
      await SharedPrefHelper.setString("user_phone", phone);
      await SharedPrefHelper.setString("user_id", uid);

      await _firestore.collection("users").doc(uid).update({
        "fcmToken": fcmToken,
        "userId": uid,
      });

      return Right(userData);
    } catch (e) {
      print("🔥 REGISTER ERROR: $e");
      return Left(ServerFailure(
          FirebaseAuthErrorMapper.fromExceptionMessage(e.toString())));
    }
  }

  // ------------------------------------------------------
  // LOGIN
  // ------------------------------------------------------
  @override
  Future<Either<Failures, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      print("➡ LOGIN…");

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;
      final uid = user.uid;

      final doc = await _firestore.collection("users").doc(uid).get();

      if (!doc.exists) {
        return Left(ServerFailure("User profile not found."));
      }

      final authUser = AuthModel.fromMap(doc.data()!, doc.id);

      final token = await user.getIdToken(true);

      // -------- FCM TOKEN SAFE MODE --------
      String? fcmToken;

      if (isIOSSimulator) {
        fcmToken = "ios_simulator_token";
      } else {
        try {
          fcmToken = await FirebaseMessaging.instance.getToken();
        } catch (_) {
          fcmToken = null;
        }
      }
      // -------------------------------------

      await SharedPrefHelper.setString("auth_token", token!);
      await SharedPrefHelper.setString("user_name", authUser.name);
      await SharedPrefHelper.setString("user_email", email);
      await SharedPrefHelper.setString("user_id", uid);

      await _firestore.collection("users").doc(uid).update({
        "fcmToken": fcmToken,
        "userId": uid,
      });

      return Right(authUser);
    } catch (e) {
      print("🔥 LOGIN ERROR: $e");
      return Left(ServerFailure(
          FirebaseAuthErrorMapper.fromExceptionMessage(e.toString())));
    }
  }

  // ------------------------------------------------------
  // CURRENT USER
  // ------------------------------------------------------
  @override
  Future<Either<Failures, AuthEntity>> getCurrentUser() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return Left(ServerFailure("No logged-in user."));
      }

      final doc = await _firestore.collection("users").doc(user.uid).get();

      if (!doc.exists) {
        return Left(ServerFailure("User profile not found."));
      }

      return Right(AuthModel.fromMap(doc.data()!, doc.id));
    } catch (e) {
      return Left(ServerFailure(
          FirebaseAuthErrorMapper.fromExceptionMessage(e.toString())));
    }
  }

  // ------------------------------------------------------
  // LOGOUT
  // ------------------------------------------------------
  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await SharedPrefHelper.remove("auth_token");
    } catch (e) {
      throw ServerFailure(
          FirebaseAuthErrorMapper.fromExceptionMessage(e.toString()));
    }
  }
  @override
  Future<Either<Failures, void>> deleteAccount() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return Left(ServerFailure("لا يوجد مستخدم مسجل الدخول."));
      }

      final uid = user.uid;

      // -----------------------------
      // 1) حذف بيانات المستخدم من Firestore
      // -----------------------------
      await _firestore.collection("users").doc(uid).delete();

      // -----------------------------
      // 2) حذف كل المشاريع (الإعلانات) الخاصة به
      // -----------------------------
      final userProjects = await _firestore
          .collection("projects")
          .where("userId", isEqualTo: uid)
          .get();

      for (var doc in userProjects.docs) {
        await doc.reference.delete();
      }

      // -----------------------------
      // 3) حذف الوظائف / طلبات العمل الخاصة به
      // -----------------------------
      final userJobs = await _firestore
          .collection("jobs")
          .where("userId", isEqualTo: uid)
          .get();

      for (var doc in userJobs.docs) {
        await doc.reference.delete();
      }

      // -----------------------------
      // 4) حذف المستخدم من Firebase Auth
      // -----------------------------
      await user.delete();

      // -----------------------------
      // 5) حذف بيانات SharedPreferences
      // -----------------------------
      await SharedPrefHelper.clear();

      return const Right(null);
    } catch (e) {
      print("🔥 DELETE ACCOUNT ERROR: $e");
      return Left(ServerFailure(
        FirebaseAuthErrorMapper.fromExceptionMessage(e.toString()),
      ));
    }
  }

}
