import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProjectDetailsSkeletonViewBody extends StatelessWidget {
  const ProjectDetailsSkeletonViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        BannerSkeleton(),
        
                        SizedBox(height: 16.h),
                        HeaderSkeleton(),
        
                        SizedBox(height: 12.h),
                        ContactsSkeleton(),
        
                        SizedBox(height: 16.h),
                        DescriptionSkeleton(),
        
                        SizedBox(height: 20.h),
                        WorkTimeSkeleton(),
        
                        SizedBox(height: 20.h),
                        Divider(),
        
                        SizedBox(height: 20.h),
                        GallerySkeleton(),
                      ],
                    ),
                  ),
                ),
              ),
        
              FooterSkeleton(),
            ],
            ),
      )
    );
  }
}

/// ===============================
/// SHIMMER HELPER
/// ===============================
Widget shimmerBox({double? height, double? width, double radius = 8}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

/// ===============================
/// SECTIONS
/// ===============================

class BannerSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return shimmerBox(
      height: 200.h,
      width: double.infinity,
      radius: 12,
    );
  }
}

class HeaderSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        shimmerBox(height: 22.h, width: 200.w),
        SizedBox(height: 10.h),
        shimmerBox(height: 16.h, width: 120.w),
      ],
    );
  }
}

class ContactsSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        shimmerBox(height: 40.h, width: 40.h, radius: 20),
        SizedBox(width: 12.w),
        shimmerBox(height: 40.h, width: 40.h, radius: 20),
        SizedBox(width: 12.w),
        shimmerBox(height: 40.h, width: 40.h, radius: 20),
        SizedBox(width: 12.w),
        shimmerBox(height: 40.h, width: 40.h, radius: 20),
      ],
    );
  }
}

class DescriptionSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        shimmerBox(height: 14.h, width: double.infinity),
        SizedBox(height: 6.h),
        shimmerBox(height: 14.h, width: double.infinity),
        SizedBox(height: 6.h),
        shimmerBox(height: 14.h, width: 250.w),
      ],
    );
  }
}

class WorkTimeSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: shimmerBox(height: 45.h)),
        SizedBox(width: 12.w),
        Expanded(child: shimmerBox(height: 45.h)),
      ],
    );
  }
}

class GallerySkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return shimmerBox(height: 110.h, width: 110.h, radius: 12);
        },
      ),
    );
  }
}

class FooterSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return shimmerBox(height: 70.h, width: double.infinity, radius: 0);
  }
}
