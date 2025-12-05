import 'dart:typed_data';

abstract class FirebaseService {
  /// جلب كل المستندات من collection معين
  Future<List<Map<String, dynamic>>> getCollection({
    required String collection,
  });

  /// جلب مستند واحد
  Future<Map<String, dynamic>?> getDocument({
    required String collection,
    required String docId,
  });

  /// إضافة مستند جديد
  Future<void> addDocument({
    required String collection,
    required Map<String, dynamic> data,
    String? docId,
  });

  /// تعديل مستند
  Future<void> updateDocument({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  });

  /// حذف مستند
  Future<void> deleteDocument({
    required String collection,
    required String docId,
  });

  /// رفع صورة وتعيد link
  Future<String> uploadFile({
    required String path,
    required String fileName,
    required Uint8List fileBytes,
  });

  /// حذف صورة من storage
  Future<void> deleteFile({
    required String path,
    required String fileName,
  });

  Future<List<Map<String, dynamic>>> getWhere({
    required String collection,
    required String field,
    required String value,
  });

  /// البحث داخل قائمة (Array)
  Future<List<Map<String, dynamic>>> getWhereArrayContains({
    required String collection,
    required String field,
    required String value,
  });

}
