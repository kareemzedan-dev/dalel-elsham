import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../widgets/dalel_elsham_tab_view_body.dart';

class DalelElshamTabView extends StatelessWidget {
  const DalelElshamTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: "دليل الشام", showBackButton: false , ),
      body: DalelElshamTabViewBody(),
    );
  }
}
