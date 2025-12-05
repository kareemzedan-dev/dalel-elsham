import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/cache/shared_preferences.dart';
import '../../../../../core/helper/pick_image_source_sheet.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/services/image_picker_service.dart';

class RegisterAvatarPicker extends StatefulWidget {
  final Function(ImagePickerResult result)? onImageSelected;

  const RegisterAvatarPicker({super.key, this.onImageSelected});

  @override
  State<RegisterAvatarPicker> createState() => _RegisterAvatarPickerState();
}

class _RegisterAvatarPickerState extends State<RegisterAvatarPicker> {
  String? avatarPath;

  void onTap() async {
    final source = await showImageSourcePicker(context);
    XFile? picked;

    if (source == "camera") {
      picked = await ImagePicker().pickImage(source: ImageSource.camera);
    } else if (source == "gallery") {
      picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (picked != null) {
      final bytes = await picked.readAsBytes();

      setState(() => avatarPath = picked!.path);


      if (widget.onImageSelected != null) {
        widget.onImageSelected!(
          ImagePickerResult(
            bytes: bytes,
            file: File(picked.path),
            path: picked.path,
          ),
        );

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: avatarPath == null
                    ? Image.asset(AssetsManager.person, fit: BoxFit.cover)
                    : Image.file(File(avatarPath!), fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.primaryColor,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
