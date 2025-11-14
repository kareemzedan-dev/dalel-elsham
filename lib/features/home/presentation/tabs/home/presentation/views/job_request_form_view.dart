import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../widgets/job_request_form_view_body.dart';

class JobRequestFormView extends StatelessWidget {
  const JobRequestFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "طلب عمل",

      ),
      body: const JobRequestFormViewBody(),
    );
  }
}
