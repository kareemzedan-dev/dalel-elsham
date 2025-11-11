import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_manager.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: ProjectItem(
              image: AssetsManager.project1,
              title: "المشروع الاول",
              description: "وصف المشروع",
              location: "الموقع",
            ),
          );
        },
      ),
    );
  }
}
