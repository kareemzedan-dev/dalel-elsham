import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'firebase_service.dart';
@Injectable(as: FirebaseService)
class FirebaseServiceImpl implements FirebaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Future<List<Map<String, dynamic>>> getCollection({
    required String collection,
  }) async {
    final snapshot = await firestore.collection(collection).get();
    return snapshot.docs.map((d) {
      return {
        ...d.data(),
        "id": d.id,
      };
    }).toList();
  }

  @override
  Future<Map<String, dynamic>?> getDocument({
    required String collection,
    required String docId,
  }) async {
    final doc = await firestore.collection(collection).doc(docId).get();
    if (!doc.exists) return null;
    return {...doc.data()!, "id": doc.id};
  }

  @override
  Future<void> addDocument({
    required String collection,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firestore.collection(collection).doc(docId).set(data);
    } else {
      await firestore.collection(collection).add(data);
    }
  }

  @override
  Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(collection).doc(docId).update(data);
  }

  @override
  Future<void> deleteDocument({
    required String collection,
    required String docId,
  }) async {
    await firestore.collection(collection).doc(docId).delete();
  }

  @override
  Future<String> uploadFile({
    required String path,
    required String fileName,
    required Uint8List fileBytes,
  }) async {
    final ref = storage.ref().child(path).child(fileName);
    await ref.putData(fileBytes);
    return await ref.getDownloadURL();
  }

  @override
  Future<void> deleteFile({
    required String path,
    required String fileName,
  }) async {
    final ref = storage.ref().child(path).child(fileName);
    await ref.delete();
  }

  @override
  Future<List<Map<String, dynamic>>> getWhere({
    required String collection,
    required String field,
    required String value,
  }) async {
    final querySnapshot = await firestore
        .collection(collection)
        .where(field, isEqualTo: value)
        .get();

    return querySnapshot.docs.map((doc) {
      return {
        "id": doc.id,
        "data": doc.data(),
      };
    }).toList();
  }



}
