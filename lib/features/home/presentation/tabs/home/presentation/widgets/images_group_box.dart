import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helper/pick_image_source_sheet.dart';
import '../../../../../../../core/services/image_picker_service.dart';
import 'add_image_box.dart';

class ImagesGroupBox extends StatefulWidget {
  final Function(List<Uint8List> imagesBytes)? onImagesSelected;

  const ImagesGroupBox({super.key, this.onImagesSelected});

  @override
  State<ImagesGroupBox> createState() => _ImagesGroupBoxState();
}

class _ImagesGroupBoxState extends State<ImagesGroupBox> {
  final ImagePickerService _picker = ImagePickerService();

  final List<Uint8List> _imagesBytes = [];
  final List<String?> _imagesPaths = [null, null, null];

  Future<void> _pickImage(int index) async {
    final source = await showImageSourcePicker(context);
    if (source == null) return;

    final res = source == "gallery"
        ? await _picker.pickFromGallery()
        : await _picker.pickFromCamera();

    if (!res.isEmpty) {
      setState(() {
        _imagesBytes.add(res.bytes!);
        _imagesPaths[index] = res.path;
      });

      widget.onImagesSelected?.call(_imagesBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Column(
        children: [
          _topCounter(),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (i) {
                return AddImageBox(
                  imageBytes: i < _imagesBytes.length ? _imagesBytes[i] : null,
                  imagePath: _imagesPaths[i],
                  onTap: () => _pickImage(i),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topCounter() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "${_imagesBytes.length}/3",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
