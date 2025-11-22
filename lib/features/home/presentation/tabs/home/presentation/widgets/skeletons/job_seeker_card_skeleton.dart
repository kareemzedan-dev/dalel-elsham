import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/utils/colors_manager.dart';

class JobSeekerCardSkeleton extends StatelessWidget {
  const JobSeekerCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorsManager.grey.withValues(alpha: 0.15),
          border: Border.all(color: Colors.grey.shade300, width: 1.5.w),
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildUserInfoSkeleton()),

                _buildAvatarAndContactSkeleton(),
              ],
            ),

            SizedBox(height: 12.h),

            _buildLocationAndDateSkeleton(),
          ],
        ),
      ),
    );
  }

  // -----------------------------
  // NAME + DESCRIPTION Skeleton
  // -----------------------------
  Widget _buildUserInfoSkeleton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _shimmerBox(height: 16.h, width: 140.w),
        SizedBox(height: 8.h),
        _shimmerBox(height: 14.h, width: double.infinity),
        SizedBox(height: 6.h),
        _shimmerBox(height: 14.h, width: 220.w),
      ],
    );
  }

  // -----------------------------
  // AVATAR + CALL BUTTON Skeleton
  // -----------------------------
  Widget _buildAvatarAndContactSkeleton() {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 1.w),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 36.h,
          width: 36.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ],
    );
  }

  // -----------------------------
  // LOCATION + DATE Skeleton
  // -----------------------------
  Widget _buildLocationAndDateSkeleton() {
    return Row(
      children: [
        Icon(Icons.location_on_outlined,
            size: 16.sp, color: Colors.grey.shade300),
        SizedBox(width: 4.w),
        _shimmerBox(height: 14.h, width: 80.w),

        SizedBox(width: 12.w),

        Icon(Icons.access_time_rounded,
            size: 16.sp, color: Colors.grey.shade300),
        SizedBox(width: 4.w),
        _shimmerBox(height: 14.h, width: 70.w),
      ],
    );
  }

  // -----------------------------
  // HELPERS
  // -----------------------------
  Widget _shimmerBox({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }
}
