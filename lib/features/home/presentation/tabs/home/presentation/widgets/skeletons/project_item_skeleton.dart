import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectItemSkeleton extends StatelessWidget {
  const ProjectItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// --- IMAGE ---
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              height: 120.h,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
          ),

          SizedBox(height: 10.h),

          /// --- TITLE ---
          Container(
            width: double.infinity,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          SizedBox(height: 6.h),

          /// line 2 of title
          Container(
            width: 100.w,
            height: 13.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),

          SizedBox(height: 10.h),

          /// --- DESCRIPTION ---
          Container(
            width: double.infinity,
            height: 12.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          SizedBox(height: 4.h),

          Container(
            width: 120.w,
            height: 11.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),

          SizedBox(height: 10.h),

          /// --- LOCATION ROW ---
          Row(
            children: [
              // location icon
              Container(
                width: 16.sp,
                height: 16.sp,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),

              SizedBox(width: 6.w),

              // location text
              Expanded(
                child: Container(
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
