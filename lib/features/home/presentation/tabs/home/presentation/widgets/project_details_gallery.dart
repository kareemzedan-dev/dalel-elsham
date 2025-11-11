import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class ProjectDetailsGallery extends StatelessWidget {
  const ProjectDetailsGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      AssetsManager.project1,
      AssetsManager.project2,
      AssetsManager.project3,
      AssetsManager.project1,
      AssetsManager.project2,
      AssetsManager.project3,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الصور :",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),


        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: images.map((image) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                color: ColorsManager.grey.withOpacity(0.2),
                child: Image.asset(
                  image,
                  height: 110.h,
                  width: 110.w,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
