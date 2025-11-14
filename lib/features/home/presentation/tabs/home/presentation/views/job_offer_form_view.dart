import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../widgets/job_offer_form_view_body.dart';

class JobOfferFormView extends StatelessWidget {
  const JobOfferFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "أضف وظيفه",

      ),
      body: const JobOfferFormViewBody(),
    );
  }
}
