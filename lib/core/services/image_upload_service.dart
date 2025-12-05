import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ImageUploadService {
  final SupabaseClient supabase = Supabase.instance.client;

  /// رفع الصورة وإرجاع رابطها
  Future<String?> uploadImage({
    required Uint8List bytes,
    required String bucket,
    String? folder,
  }) async {
    try {
      final imageId = const Uuid().v4();
      final path = folder != null ? "$folder/$imageId.jpg" : "$imageId.jpg";

      final response = await supabase.storage.from(bucket).uploadBinary(
        path,
        bytes,
        fileOptions: const FileOptions(contentType: "image/jpeg"),
      );

      if (response.isEmpty) return null;

      final imageUrl = supabase.storage.from(bucket).getPublicUrl(path);
      return imageUrl;

    } catch (e) {
      print("Upload error: $e");
      return null;
    }
  }
}
