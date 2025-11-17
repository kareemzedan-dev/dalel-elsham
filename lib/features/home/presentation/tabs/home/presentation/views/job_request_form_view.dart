import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/jobs/add_job_view_model/add_job_view_model.dart';
import '../widgets/job_request_form_view_body.dart';

class JobRequestFormView extends StatelessWidget {
  const JobRequestFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "طلب عمل",

      ),
      body: BlocProvider(
          create: (context) => getIt<AddJobViewModel>(),
          child: const JobRequestFormViewBody()),
    );
  }
}
