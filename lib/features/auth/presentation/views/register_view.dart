import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_app_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "إنشاء حساب"),
      body: SafeArea(child: RegisterViewBody()),
    );
  }
}
