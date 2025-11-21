import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemSkeleton extends StatelessWidget {
  const CategoryItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // الصورة الدائرية
        Container(
          padding: EdgeInsets.all(1.r),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Container(
              height: 50.h,
              width: 50.w,
              color: Colors.grey.shade300,
            ),
          ),
        ),

        SizedBox(height: 8.h),

        // النص (مستطيل صغير)
        Container(
          width: 50.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }
}
