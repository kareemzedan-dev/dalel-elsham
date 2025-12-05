import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';

import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class AddImageBox extends StatelessWidget {
  final Uint8List? imageBytes;
  final String? imagePath;
  final VoidCallback? onTap;

  const AddImageBox({
    super.key,
    this.imageBytes,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey, width: 1.w),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: _buildImage(),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageBytes != null) {
      return Image.memory(imageBytes!, fit: BoxFit.cover);
    }
    if (imagePath != null) {
      return Image.file(File(imagePath!), fit: BoxFit.cover);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _circleIcon(),
        SizedBox(height: 5.h),
        Text(
          "اضافه صوره",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: ColorsManager.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _circleIcon() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AssetsManager.addNewServiceImage,
          height: 24.h,
          width: 24.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
