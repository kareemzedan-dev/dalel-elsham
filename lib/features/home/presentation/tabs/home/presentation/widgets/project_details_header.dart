import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';

class ProjectDetailsHeader extends StatelessWidget {
  const ProjectDetailsHeader({
    super.key,
    required this.title,
    required this.location,
  });

  final String title, location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// عنوان المشروع
        Text(
          title,
          softWrap: true,
          overflow: TextOverflow.visible,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),

        SizedBox(height: 8.h),

        /// الموقع
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20.sp,
              color: ColorsManager.primaryColor,
            ),
            SizedBox(width: 4.w),

            /// نضيف Expanded عشان النص يكسر سطر ويكمل
            Expanded(
              child: Text(
                location,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  height: 1.6,
                  color: ColorsManager.primaryColor,
                ),
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
