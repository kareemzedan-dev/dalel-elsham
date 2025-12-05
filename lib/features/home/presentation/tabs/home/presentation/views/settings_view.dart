import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../widgets/settings_view_body.dart';

class  SettingsView extends StatelessWidget {
  const  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "الاعدادات"),
      body: const SettingsViewBody(),
    );
  }
}
