import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/helper/pick_image_source_sheet.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';

class RegisterAvatarPicker extends StatefulWidget {

  final Function(String path)? onImageSelected;

  const RegisterAvatarPicker({
    super.key,
    this.onImageSelected,
  });

  @override
  State<RegisterAvatarPicker> createState() => _RegisterAvatarPickerState();
}

class _RegisterAvatarPickerState extends State<RegisterAvatarPicker> {
  String? avatarPath;

  void onTap() {
    showImageSourcePicker(context).then((value) async {
      XFile? picked;

      if (value == "camera") {
        picked = await ImagePicker().pickImage(source: ImageSource.camera);
      } else if (value == "gallery") {
        picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      }

      if (picked != null) {
        setState(() {
          avatarPath = picked!.path;
        });

        // 🔥 هنا بندي الباث للسك्रीन الأم
        if (widget.onImageSelected != null) {
          widget.onImageSelected!(picked.path);
        }
      }
    });
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
            child: ClipOval(
              child: avatarPath == null
                  ? Image.asset(AssetsManager.person, fit: BoxFit.cover)
                  : Image.file(File(avatarPath!), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.primaryColor,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
