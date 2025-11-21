import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleSkeleton extends StatelessWidget {
  const TitleSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }
}
