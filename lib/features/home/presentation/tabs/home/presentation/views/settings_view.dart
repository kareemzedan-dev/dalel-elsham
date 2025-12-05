import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../auth/presentation/manager/delete_account_view_model/delete_account_view_model.dart';
import '../widgets/settings_view_body.dart';

class  SettingsView extends StatelessWidget {
  const  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "الاعدادات"),
      body: BlocProvider(
          create: (context) => getIt<DeleteAccountViewModel>(),
          child: const SettingsViewBody()),
    );
  }
}
