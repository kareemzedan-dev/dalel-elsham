import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/projects_list.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/section_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/project_display_section_entity.dart';

class ProjectDisplaySectionsList extends StatelessWidget {
  const ProjectDisplaySectionsList({
    super.key,
    required this.projectDisplaySections,
    required this.builder,
  });

  final List<ProjectDisplaySectionEntity> projectDisplaySections;

  /// 👈 callback يرجع ويدجت لكل قسم
  final Widget Function(String sectionId) builder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projectDisplaySections.length,
      itemBuilder: (context, index) {
        final section = projectDisplaySections[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical:  30.0),
          child: SectionWidget(
            title: section.title,
            child: builder(section.id),
          ),
        );
      },
    );
  }
}
