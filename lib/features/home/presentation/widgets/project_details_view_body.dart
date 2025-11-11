import 'package:dalel_elsham/features/home/presentation/widgets/project_details_contacts.dart';
import 'package:dalel_elsham/features/home/presentation/widgets/project_details_description.dart';
import 'package:dalel_elsham/features/home/presentation/widgets/project_details_gallery.dart';
import 'package:dalel_elsham/features/home/presentation/widgets/project_details_header.dart';
import 'package:dalel_elsham/features/home/presentation/widgets/project_details_worktime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors_manager.dart';
import 'banner_section.dart';
import 'project_details_footer.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ محتوى الصفحة قابل للتمرير
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  const BannerSection(),
                  SizedBox(height: 16.h),
                  const ProjectDetailsHeader(),
                  SizedBox(height: 8.h),
                  const ProjectDetailsContacts(),
                  SizedBox(height: 8.h),
                  const ProjectDetailsDescription(),
                  SizedBox(height: 16.h),
                  const ProjectDetailsWorkTime(),
                  SizedBox(height: 8.h),
                  Divider(thickness: 1.w, color: Colors.grey),
                  SizedBox(height: 16.h),
                  const ProjectDetailsGallery(),
                ],
              ),
            ),
          ),
        ),


        const ProjectDetailsFooter(),

      ],
    );
  }
}
