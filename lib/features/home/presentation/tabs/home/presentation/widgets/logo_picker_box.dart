import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../../../../core/helper/pick_image_source_sheet.dart';
import '../../../../../../../core/services/image_picker_service.dart';

class LogoPickerBox extends StatefulWidget {
  final void Function(ImagePickerResult result)? onPicked;

  const LogoPickerBox({super.key, this.onPicked});

  @override
  State<LogoPickerBox> createState() => _LogoPickerBoxState();
}

class _LogoPickerBoxState extends State<LogoPickerBox> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  Uint8List? _pickedBytes;
  String? _pickedPath;

  Future<void> _openPicker() async {
    final choice = await showImageSourcePicker(context);

    if (choice == null) return;

    ImagePickerResult res;

    res = choice == "gallery"
        ? await _imagePickerService.pickFromGallery(quality: 80)
        : await _imagePickerService.pickFromCamera(quality: 80);

    if (!res.isEmpty) {
      setState(() {
        _pickedBytes = res.bytes;
        _pickedPath = res.path;
      });
      widget.onPicked?.call(res);
    }
  }

  Widget _buildImage() {
    if (_pickedBytes != null) {
      return Image.memory(
        _pickedBytes!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (_pickedPath != null) {
      return Image.file(
        File(_pickedPath!),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_a_photo),
        SizedBox(height: 6),
        Text("اضف شعار"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openPicker,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _buildImage(),
        ),
      ),
    );
  }
}
