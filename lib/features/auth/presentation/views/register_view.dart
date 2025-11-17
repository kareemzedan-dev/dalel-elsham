import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/di/di.dart';
import '../manager/register_view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "إنشاء حساب"),
      body: SafeArea(child: BlocProvider(

          create: (context) => getIt<RegisterViewModel>(),
          child: RegisterViewBody())),
    );
  }
}
