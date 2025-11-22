import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../widgets/privacy_policy_view_body.dart';


class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:CustomAppBar(title: "سياسة الاستخدام",),
      body: const SafeArea(child: PrivacyPolicyViewBody()),
    );
  }
}