import 'package:dalel_elsham/features/home/presentation/widgets/banner_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors_manager.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h,),
            BannerSection(),
            SizedBox(height: 16.h,),
            Text(
              "عنوان المشروع",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, size: 24.sp,color: ColorsManager.primaryColor,),
              SizedBox(width: 4.w),
              Text(
                "الشام",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,),
              ),

            ],
           )



          ],
        ),
      ),
    );
  }
}
