import 'package:flutter/material.dart';
import 'package:dalel_elsham/core/components/custom_app_bar.dart';
import '../../../../../../../core/utils/strings_manager.dart';
import '../widgets/privacy_policy_view_body.dart';

class InfoPageView extends StatelessWidget {
  final String title;

  const InfoPageView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body:   SafeArea(
        child: PrivacyPolicyViewBody(
          title: title == "سياسة الاستخدام" ? StringsManager.privacyPolicyTitle :  StringsManager.aboutAsTitle,
          content: title == "سياسة الاستخدام" ? StringsManager.privacyPolicyContent : StringsManager.aboutAsContent,
        ),
      ),
    );
  }
}
