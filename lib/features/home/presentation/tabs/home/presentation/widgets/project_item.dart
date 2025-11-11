import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors_manager.dart';


class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.image, required this.title, required this.description, required this.location});
  final String image;
  final String title;
  final String description;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 140.w,
      decoration: BoxDecoration(
        color: ColorsManager.grey,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.h,
              width: 140.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset( image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 4.h),
            Text(
             description,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  location,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
