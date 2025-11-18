import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/projects/get_project_details_view_model/get_project_details_view_model.dart';
import '../widgets/project_details_view_body.dart';

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key,required this.projectId,required this.projectName});
  final String projectId , projectName;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title:projectName,showWatch: true,),
      body: BlocProvider(
          create: (context) => getIt<GetProjectDetailsViewModel>()..getProjectDetails(projectId),
          child: const ProjectDetailsViewBody()),
    );
  }
}
