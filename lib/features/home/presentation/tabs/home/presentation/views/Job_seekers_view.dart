import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/add_floating_button.dart';
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
      body: const JobSeekersViewBody(),
    );
  }
}
