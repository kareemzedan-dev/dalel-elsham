import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../widgets/Job_opportunities_view_body.dart';

class JobOpportunitiesView extends StatelessWidget {
  const JobOpportunitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: const JobOpportunitiesViewBody(),
    );
  }
}
