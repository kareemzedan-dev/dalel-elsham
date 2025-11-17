import 'package:dalel_elsham/config/routes/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_text_field.dart';
import '../../../../../core/components/or_divider.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';


class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key });


  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 16.h),
          Center(
            child: Text(
              "مرحبًا بعودتك 👋",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 22.sp,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Container(
              height: 150.h,
              width: 150.w,
               decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 2.w),
               ),
              child: ClipOval(
                child: Image.asset(
                  AssetsManager.loginImage,
                  height: 150.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ),
          SizedBox(height: 32.h),

          // البريد الإلكتروني
          CustomTextFormField(
            prefixIcon: const Icon(CupertinoIcons.mail),
            hintText: "البريد الإلكتروني",
            textEditingController: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
            (value == null || value.trim().isEmpty) ? "هذا الحقل مطلوب" : null,
            onSaved: (v) => _emailController.text = v ?? '',
          ),
          SizedBox(height: 24.h),

          // كلمة المرور
          CustomTextFormField(
            prefixIcon: const Icon(CupertinoIcons.lock),
            hintText: "كلمة المرور",
            textEditingController: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            iconShow: true,
            validator: (value) =>
            (value == null || value.trim().isEmpty) ? "هذا الحقل مطلوب" : null,
            onSaved: (v) => _passwordController.text = v ?? '',
          ),

          // SizedBox(height: 20.h),
          // const OrDivider(),
          SizedBox(height: 50.h),



          // زر الدخول (يتحقق من الفورم فقط)
          CustomButton(
            text: "تسجيل الدخول",
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                // UI فقط — بدون API
                // ممكن تعمل Snackbar بسيط
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم التحقق من البيانات ✔")),
                );
              } else {
                setState(() => _autovalidateMode = AutovalidateMode.onUserInteraction);
              }
            },
          ),

          SizedBox(height: 12.h),

          // لا تملك حساباً؟
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "لا تملك حسابًا؟",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 5.w),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "إنشاء حساب",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorsManager.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
