import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../widgets/project_details_view_body.dart';

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "تفاصيل المشروع",showWatch: true,),
      body: const ProjectDetailsViewBody(),
    );
  }
}
