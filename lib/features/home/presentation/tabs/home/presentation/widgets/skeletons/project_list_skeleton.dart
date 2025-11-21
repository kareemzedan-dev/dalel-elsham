import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'project_item_skeleton.dart';

class ProjectListSkeleton extends StatelessWidget {
  const ProjectListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: const ProjectItemSkeleton(),
        ),
      ),
    );
  }
}
