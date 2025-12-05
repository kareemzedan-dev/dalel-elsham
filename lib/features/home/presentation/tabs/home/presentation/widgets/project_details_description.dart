import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetailsDescription extends StatelessWidget {
  const ProjectDetailsDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(thickness: 1.w, color: Colors.grey),
        SizedBox(height: 8.h),
        Text(
          "تفاصيل المشروع",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            height: 1.6,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
