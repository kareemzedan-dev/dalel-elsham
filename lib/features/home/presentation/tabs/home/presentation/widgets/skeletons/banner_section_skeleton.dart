import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSectionSkeleton extends StatelessWidget {
  const BannerSectionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---- صورة البانر ----
        Container(
          height: 200.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),

        SizedBox(height: 12.h),

        // ---- النقاط ----
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
                (_) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
