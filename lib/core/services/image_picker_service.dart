import 'dart:typed_data';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerResult {
  final Uint8List? bytes;
  final File? file;
  final String? path;

  ImagePickerResult({this.bytes, this.file, this.path});

  bool get isEmpty => bytes == null && file == null && (path == null || path!.isEmpty);
}

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// اختيار صورة من المعرض بدون أي إذن (Android & iOS)
  Future<ImagePickerResult> pickFromGallery({
    int? maxWidth,
    int? maxHeight,
    int? quality,
  }) async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth?.toDouble(),
      maxHeight: maxHeight?.toDouble(),
      imageQuality: quality,
    );
    return await _toResult(picked);
  }


  Future<ImagePickerResult> pickFromCamera({
    int? maxWidth,
    int? maxHeight,
    int? quality,
  }) async {
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

  // تحويل XFile لنتيجة
  Future<ImagePickerResult> _toResult(XFile? xfile) async {
    if (xfile == null) return ImagePickerResult();

    try {
      final bytes = await xfile.readAsBytes();
      final file = File(xfile.path);
      return ImagePickerResult(bytes: bytes, file: file, path: xfile.path);
    } catch (_) {
      return ImagePickerResult(file: File(xfile.path), path: xfile.path);
    }
  }

  /// طلب إذن الكاميرا فقط – مسموح من Google Play
  Future<bool> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }
}
