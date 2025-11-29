import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/projects/get_project_details_view_model/get_project_details_view_model.dart';
import '../manager/projects/get_project_details_view_model/get_project_details_view_model_states.dart';
import '../widgets/project_details_view_body.dart';
import '../widgets/skeletons/project_details_skeleton_view_body.dart';

class ProjectDetailsView extends StatelessWidget {
  final String projectId;

  const ProjectDetailsView({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<GetProjectDetailsViewModel>()..getProjectDetails(projectId),
      child:
          BlocBuilder<
            GetProjectDetailsViewModel,
            GetProjectDetailsViewModelStates
          >(
            builder: (context, state) {
              if (state is GetProjectDetailsViewModelLoading) {
                return  ProjectDetailsSkeletonViewBody();
              }

              if (state is GetProjectDetailsViewModelError) {
                return  ProjectDetailsSkeletonViewBody();
              }

              if (state is GetProjectDetailsViewModelSuccess) {
                final project = state.project;

                return Scaffold(
                  appBar: project.viewCountOn == false
                      ? CustomAppBar(title: project.title, showWatch: false)
                      : CustomAppBar(
                          title: project.title,
                          showWatch: true,
                          watchCount: project.views.toString(),
                        ),
                  body: const ProjectDetailsViewBody(),
                );
              }

              return  ProjectDetailsSkeletonViewBody();
            },
          ),
    );
  }
}
