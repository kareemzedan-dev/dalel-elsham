import 'dart:typed_data';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerResult {
  final Uint8List? bytes; // لو حبيت تستخدم البايتات مباشرة
  final File? file;       // أو الملف (path)
  final String? path;

  ImagePickerResult({this.bytes, this.file, this.path});

  bool get isEmpty => bytes == null && file == null && (path == null || path!.isEmpty);
}

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// استخدام المعرض
  Future<ImagePickerResult> pickFromGallery({int? maxWidth, int? maxHeight, int? quality}) async {
    final granted = await _requestStoragePermission();
    if (!granted) return ImagePickerResult();
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth?.toDouble(),
      maxHeight: maxHeight?.toDouble(),
      imageQuality: quality, // 0-100
    );
    return await _toResult(picked);
  }

  /// استخدام الكاميرا
  Future<ImagePickerResult> pickFromCamera({int? maxWidth, int? maxHeight, int? quality}) async {
    final granted = await _requestCameraPermission();
    if (!granted) return ImagePickerResult();
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: maxWidth?.toDouble(),
      maxHeight: maxHeight?.toDouble(),
      imageQuality: quality,
    );
    return await _toResult(picked);
  }

  // تحويل XFile لنتيجة مفيدة
  Future<ImagePickerResult> _toResult(XFile? xfile) async {
    if (xfile == null) return ImagePickerResult();
    try {
      final bytes = await xfile.readAsBytes();
      final file = File(xfile.path);
      return ImagePickerResult(bytes: bytes, file: file, path: xfile.path);
    } catch (_) {
      // لو القراءة فشلت، نعيد الملف فقط
      return ImagePickerResult(file: File(xfile.path), path: xfile.path);
    }
  }

  // اطلب إذن معرض/ملفات (Android 13+ يحتاج READ_MEDIA_IMAGES)
  Future<bool> _requestStoragePermission() async {
    // permission_handler يتعامل مع اختلافات الأنظمة
    if (Platform.isAndroid) {
      // Android 13+ uses READ_MEDIA_IMAGES
      final status = await Permission.photos.request();
      return status.isGranted;
    } else {
      final status = await Permission.photos.request();
      return status.isGranted;
    }
  }

  Future<bool> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }
}
