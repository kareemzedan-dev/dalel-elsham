import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/category_item_list_skeleton.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/project_list_skeleton.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/title_skeleton.dart';

class DisplaySectionsSkeleton extends StatelessWidget {
  const DisplaySectionsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ---------------- Categories ----------------
        const TitleSkeleton(),
        SizedBox(height: 10.h),
        const CategoryItemListSkeleton(),
        SizedBox(height: 30.h),

        /// ---------------- First Section ----------------
        const TitleSkeleton(),
        SizedBox(height: 10.h),
        const ProjectListSkeleton(),
        SizedBox(height: 30.h),

        /// ---------------- Services ----------------
        const TitleSkeleton(),
        SizedBox(height: 10.h),
        Container(
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        SizedBox(height: 30.h),

        /// ---------------- Newest Projects ----------------
        const TitleSkeleton(),
        SizedBox(height: 10.h),
        const ProjectListSkeleton(),
        SizedBox(height: 30.h),

        /// ---------------- More Sections ----------------
        const TitleSkeleton(),
        SizedBox(height: 10.h),
        const ProjectListSkeleton(),
        SizedBox(height: 30.h),
      ],
    );
  }
}
