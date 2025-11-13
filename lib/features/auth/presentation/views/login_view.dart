import 'package:dalel_elsham/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "تسجيل الدخول"),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
