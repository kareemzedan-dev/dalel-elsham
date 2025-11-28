import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProjectCardSkeleton extends StatelessWidget {
  const CategoryProjectCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade300.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ░░ الصورة ░░
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    height: 120.h,
                    width: 100.w,
                    color: Colors.grey.shade300,
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ░░ عنوان ░░
                      Container(
                        height: 16.h,
                        width: 150.w,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 6.h),

                      // ░░ وصف ░░
                      Container(
                        height: 14.h,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        height: 14.h,
                        width: 180.w,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10.h),

                      // ░░ موقع ░░
                      Row(
                        children: [
                          Container(
                            height: 14.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Container(
                            height: 14.h,
                            width: 120.w,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),

                      // ░░ أزرار التواصل ░░
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 34.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            height: 34.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // ░░ الميدالية ░░
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Icon(
              Icons.workspace_premium,
              size: 16.sp,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
