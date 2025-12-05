import 'dart:io';

import 'package:dalel_elsham/config/routes/routes_manager.dart';
import 'package:dalel_elsham/core/components/mobile_number_field.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_avatar_picker.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_footer.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_form_fields.dart';
import 'package:dalel_elsham/features/auth/presentation/views/widgets/register_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/cache/shared_preferences.dart';
import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_text_field.dart';
import '../../../../../core/components/dismissible_error_card.dart';
import '../../../../../core/services/image_upload_service.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';

import '../../manager/register_view_model/register_view_model.dart';
import '../../manager/register_view_model/register_view_model_states.dart';
import 'build_privacy_policy.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? avatarPath;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterViewModel, RegisterViewModelStates>(
      listener: (context, state) {
        if (state is RegisterViewModelStatesSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesManager.home,
            (route) => false,
          );
        }
        if (state is RegisterViewModelStatesError) {
          showTemporaryMessage(context, state.message, MessageType.error);
        }
      },
      builder: (context, state) {
        final isLoading = state is RegisterViewModelStatesLoading;
        final uploader = ImageUploadService();

        return Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterHeader(),
                  SizedBox(height: 16),

                  RegisterAvatarPicker(
                    onImageSelected: (result) async {
                      if (result.bytes == null) return;

                      final url = await uploader.uploadImage(
                        bytes: result.bytes!,
                        bucket: "users",
                        folder: "avatars",
                      );

                      if (url != null) {
                        setState(() => avatarPath = url);

                        SharedPrefHelper.setString("avatar_path", url);
                      }
                    },
                  ),

                  SizedBox(height: 24),
                  RegisterFormFields(),
                  SizedBox(height: 24),
                  RegisterFooter(),
                ],
              ),
            ),

            if (isLoading)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
