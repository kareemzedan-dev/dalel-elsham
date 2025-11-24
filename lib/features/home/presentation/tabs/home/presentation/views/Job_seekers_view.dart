import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/add_floating_button.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/jobs/get_all_jobs_view_model/get_all_jobs_view_model.dart';
import '../widgets/Job_seekers_view_body.dart';
import '../widgets/job_request_form_view_body.dart';
import 'job_request_form_view.dart';

class JobSeekersView extends StatelessWidget {
  const JobSeekersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: AddFloatingButton(
        label: 'طلب عمل',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const JobRequestFormView()));

        },
      ),
      body: BlocProvider(
          create: (context) => getIt<GetAllJobsViewModel>()..getAllJobs(),
          child: const JobSeekersViewBody()),
    );
  }
}
