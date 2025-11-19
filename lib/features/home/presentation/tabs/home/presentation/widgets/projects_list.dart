import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_manager.dart';
import '../../domain/entities/project_entity.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key, required this.projects});

  final List<ProjectEntity> projects;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: ProjectItem(projectEntity: projects[index]),
          );
        },
      ),
    );
  }
}
