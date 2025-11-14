import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';

class ProjectDetailsHeader extends StatelessWidget {
  const ProjectDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "عنوان المشروع",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined,
                size: 24.sp, color: ColorsManager.primaryColor),
            SizedBox(width: 4.w),
            Text(
              "دمشق",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Divider(thickness: 1.w, color: Colors.grey),
      ],
    );
  }
}
