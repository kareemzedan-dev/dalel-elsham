import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/components/add_floating_button.dart';
import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../widgets/job_opportunities_view_body.dart';
import 'job_offer_form_view.dart';

class JobOpportunitiesView extends StatelessWidget {
  const JobOpportunitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddFloatingButton(
        label: 'أضف وظيفة',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JobOfferFormView()),
          );
        },
      ),
      body: const JobOpportunitiesViewBody(),
    );
  }
}
