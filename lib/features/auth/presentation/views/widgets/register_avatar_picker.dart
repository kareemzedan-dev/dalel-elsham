import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';

class RegisterAvatarPicker extends StatefulWidget {
  const RegisterAvatarPicker({super.key});

  @override
  State<RegisterAvatarPicker> createState() => _RegisterAvatarPickerState();
}

class _RegisterAvatarPickerState extends State<RegisterAvatarPicker> {
  String? avatarPath;

  void _pickImage() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('اختيار من المعرض'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('التقاط صورة'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
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
              onTap: _pickImage,
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
