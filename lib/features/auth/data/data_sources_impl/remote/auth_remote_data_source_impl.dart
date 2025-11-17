import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/cache/shared_preferences.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/firebase_service.dart';
import '../../../domain/entities/auth_entity.dart';
import '../../data_sources/remote/auth_remote_data_source.dart';
import '../../model/auth_model.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseService firebaseService;

  AuthRemoteDataSourceImpl(this.firebaseService);

  /// ------------------------------------------------------
  /// 🔵 REGISTER
  /// ------------------------------------------------------
  @override
  Future<Either<Failures, AuthEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      // 1) Create user in Firebase Auth
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;
      final uid = user.uid;

      // 2) Save user data in Firestore
      final userData = AuthModel(
        id: uid,
        name: name,
        email: email,
        phone: phone,
        profileImage: "",
      );

      await _firestore.collection("users").doc(uid).set(userData.toMap());

      // 3) Get token from Firebase Auth
      final token = await user.getIdToken();

      // 4) Save token in SharedPrefs
      await SharedPrefHelper.setString("auth_token", token!);

      return Right(userData);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


  /// ------------------------------------------------------
  /// 🔵 LOGIN
  /// ------------------------------------------------------
  @override
  Future<Either<Failures, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;
      final uid = user.uid;

      // 1) Fetch profile
      final doc = await _firestore.collection("users").doc(uid).get();
      if (!doc.exists) {
        return Left(ServerFailure("User profile not found in Firestore."));
      }

      final authUser = AuthModel.fromMap(doc.data()!, doc.id);

      // 2) Fetch token
      final token = await user.getIdToken();

      // 3) Save to SharedPrefs
      await SharedPrefHelper.setString("auth_token", token!);

      return Right(authUser);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


  /// ------------------------------------------------------
  /// 🔵 GET CURRENT USER
  /// ------------------------------------------------------
  @override
  Future<Either<Failures, AuthEntity>> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return Left(ServerFailure("No logged-in user."));
      }

      final doc = await _firestore.collection("users").doc(user.uid).get();

      if (!doc.exists) {
        return Left(ServerFailure("User profile not found in Firestore."));
      }

      return Right(AuthModel.fromMap(doc.data()!, doc.id));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// ------------------------------------------------------
  /// 🔵 LOGOUT
  /// ------------------------------------------------------
  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await SharedPrefHelper.remove("auth_token");
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

}
