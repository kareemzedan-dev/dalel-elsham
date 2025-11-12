import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/add_floating_button.dart';
import '../widgets/Job_seekers_view_body.dart';

class JobSeekersView extends StatelessWidget {
  const JobSeekersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: AddFloatingButton(
        label: 'طلب عمل',
        onPressed: () {

        },
      ),
      body: const JobSeekersViewBody(),
    );
  }
}
