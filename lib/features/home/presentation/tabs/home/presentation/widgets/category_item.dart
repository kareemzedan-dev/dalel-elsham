import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.title, required this.onTap});

  final String image, title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(1.r),
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,

              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 50.h,
                width: 50.w,
              ),
            ),
          ),

          SizedBox(height: 8.h),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold,fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
