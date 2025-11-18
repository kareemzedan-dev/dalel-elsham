import 'package:dalel_elsham/features/auth/presentation/manager/register_view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_text_field.dart';
import '../../../../../core/components/dismissible_error_card.dart';
import '../../../../../core/components/custom_button.dart';
import '../../../../../core/validators/register_validators.dart';
import '../../manager/register_view_model/register_view_model_states.dart';
class RegisterFormFields extends StatefulWidget {
  const RegisterFormFields({super.key});

  @override
  State<RegisterFormFields> createState() => _RegisterFormFieldsState();
}

class _RegisterFormFieldsState extends State<RegisterFormFields> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();

  AutovalidateMode validateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: validateMode,
      child: Column(
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.name,
            hintText: "الاسم",
            textEditingController: name,
            prefixIcon: const Icon(Icons.person),
            validator: RegisterValidators.validateName,
          ),
          SizedBox(height: 20.h),

          CustomTextFormField(
            hintText: "البريد الإلكتروني",
            textEditingController: email,
            prefixIcon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: RegisterValidators.validateEmail,
          ),
          SizedBox(height: 20.h),

          CustomTextFormField(
            keyboardType: TextInputType.visiblePassword,
            hintText: "كلمة المرور",
            textEditingController: pass,
            prefixIcon: const Icon(Icons.lock),
            iconShow: true,
            validator: RegisterValidators.validatePassword,
          ),
          SizedBox(height: 20.h),

          CustomButton(
            text: "إنشاء حساب",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<RegisterViewModel>().register(
                  name: name.text,
                  email: email.text,
                  password: pass.text,
                  phone: "",
                );
              } else {
                setState(() {
                  validateMode = AutovalidateMode.onUserInteraction;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
