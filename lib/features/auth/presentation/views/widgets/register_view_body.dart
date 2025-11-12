import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_text_field.dart';
import '../../../../../core/components/or_divider.dart';
import '../../../../../core/utils/colors_manager.dart';

import 'build_privacy_policy.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool isFreelancer = false;

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),

            /// العنوان الفرعي
            Center(
              child: Text(
                "انشاء حساب جديد",

                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 20.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            CustomTextFormField(
              prefixIcon: const Icon(CupertinoIcons.person),
              hintText: "الاسم",
              textEditingController: _lNameController,
              validator: (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null,
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 24.h),

            /// البريد الإلكتروني
            CustomTextFormField(
              prefixIcon: const Icon(CupertinoIcons.mail),
              hintText: "البريد الإلكتروني",
              textEditingController: _emailController,
              validator: (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null,
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 24.h),

            /// كلمة المرور
            CustomTextFormField(
              prefixIcon: const Icon(CupertinoIcons.lock),
              hintText: "كلمة المرور",
              textEditingController: _passwordController,
              iconShow: true,
              validator: (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null,
              keyboardType: TextInputType.visiblePassword,
            ),

            // SizedBox(height: 24.h),
            //
            // /// البريد الإلكتروني
            // CustomTextFormField(
            //   prefixIcon: const Icon(CupertinoIcons.phone),
            //   hintText: "رقم الهاتف",
            //   textEditingController: _phoneController,
            //   validator: (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null,
            //   keyboardType: TextInputType.phone,
            // ),
            SizedBox(height: 20.h),

            /// سياسة الخصوصية
            PrivacyPolicyWithCheck(),

            SizedBox(height: 30.h),
            // const OrDivider(),
            // SizedBox(height: 20.h),

            // /// تسجيل عبر السوشيال (UI فقط)
            // SocialLoginOptions(
            //   onGoogleLogin: () {
            //     debugPrint("Google login tapped (UI only)");
            //   },
            //   onFacebookLogin: () {
            //     debugPrint("Facebook login tapped (UI only)");
            //   },
            // ),
            SizedBox(height: 48.h),

            /// زر إنشاء حساب
            CustomButton(
              text: "إنشاء حساب",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم التحقق من البيانات ✔")),
                  );
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.onUserInteraction;
                  });
                }
              },
            ),

            SizedBox(height: 5.h),

            /// لديك حساب بالفعل؟
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "لديك حساب بالفعل؟",
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
                    "تسجيل الدخول",
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
      ),
    );
  }
}
