import 'dart:io';

import 'package:dalel_elsham/config/routes/routes_manager.dart';
import 'package:dalel_elsham/core/components/mobile_number_field.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_avatar_picker.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_footer.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_form_fields.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_text_field.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';

import 'build_privacy_policy.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterHeader(),
          SizedBox(height: 16),
          RegisterAvatarPicker(),
          SizedBox(height: 24),
          RegisterFormFields(),
          SizedBox(height: 24),
          RegisterFooter(),
        ],
      ),
    );

  }
}