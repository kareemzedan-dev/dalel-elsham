import 'package:flutter/material.dart';
import 'package:dalel_elsham/core/components/custom_app_bar.dart';
import '../../../../../../../core/utils/strings_manager.dart';
import '../widgets/privacy_policy_view_body.dart';

class InfoPageView extends StatelessWidget {
  final String pageType;
  // القيم المتوقعة: "terms" أو "privacy" أو "about"

  const InfoPageView({super.key, required this.pageType});

  @override
  Widget build(BuildContext context) {
    String title = "";
    String content = "";

    // ------------------ تحديد المحتوى والعنوان حسب الصفحة ------------------
    if (pageType == "terms") {
      title = StringsManager.termsOfUseTitle;
      content = StringsManager.termsOfUseContent;
    }
    else if (pageType == "privacy") {
      title = StringsManager.privacyPolicyTitle;
      content = StringsManager.privacyPolicyContent;
    }
    else if (pageType == "about") {
      title = StringsManager.aboutAsTitle;
      content = StringsManager.aboutAsContent;
    }

    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: SafeArea(
        child: PrivacyPolicyViewBody(
          title: title,
          content: content,
        ),
      ),
    );
  }
}
