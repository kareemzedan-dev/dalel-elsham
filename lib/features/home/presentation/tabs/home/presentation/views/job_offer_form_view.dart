import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/jobs/add_opportunity_view_model/add_opportunity_view_model.dart';
import '../widgets/job_offer_form_view_body.dart';

class JobOfferFormView extends StatelessWidget {
  const JobOfferFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "أضف وظيفه",

      ),
      body: BlocProvider(
          create: (context) => getIt<AddOpportunityViewModel>(),
          child: const JobOfferFormViewBody()),
    );
  }
}
