import 'dart:io';

import 'package:dalel_elsham/core/components/mobile_number_field.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool isFreelancer = false;

  String? _avatarPath; // لو بعدين هتستخدم ImagePicker خزّن المسار هنا

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _onChangeAvatarPressed() async {
    // TODO: نفّذ هنا منطق اختيار الصورة (image_picker أو غيره)
    // مثال: final picked = await ImagePicker().pickImage(...);
    // ثم setState(() => _avatarPath = picked.path);
    debugPrint("Change avatar tapped");
    // مؤقتاً نظهر مربع حوار للتأكيد
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading:   Icon(Icons.photo_library,size: 24.sp,),
              title:   Text('اختيار من المعرض',style: TextStyle(fontSize: 16.sp),),
              onTap: () {
                Navigator.pop(context);
                // TODO: اختيار من المعرض
              },
            ),
            ListTile(
              leading:   Icon(Icons.photo_camera,size: 24.sp,),
              title:   Text('التقاط صورة',style: TextStyle(fontSize: 16.sp),),
              onTap: () {
                Navigator.pop(context);
                // TODO: التقاط صورة بالكاميرا
              },
            ),
            ListTile(
              leading:   Icon(Icons.close,size: 24.sp ,),
              title:   Text('إلغاء',style: TextStyle(fontSize: 16.sp),),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
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
            Center(
              child: Text(
                "انشاء حساب جديد",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 2.w),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:ClipOval(
                        child: _avatarPath == null
                            ? Image.asset(
                          AssetsManager.person,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                            : Image.file(
                          File(_avatarPath!),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )

                    ),
                  ),

                  // زر + صغير فوق الصورة
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 2,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.r),
                        onTap: _onChangeAvatarPressed,
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsManager.primaryColor,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            CustomTextFormField(
              prefixIcon: const Icon(CupertinoIcons.person),
              hintText: "الاسم",
              textEditingController: _lNameController,
              validator: (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 24.h),
            CustomTextFormField(
              prefixIcon: const Icon(CupertinoIcons.mail),
              hintText: "البريد الإلكتروني",
              textEditingController: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "هذا الحقل مطلوب";
                }

                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                if (!emailRegex.hasMatch(value)) {
                  return "الرجاء إدخال بريد إلكتروني صحيح";
                }

                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 6.h),
            Text(
              "⚠ يرجى استخدام بريد إلكتروني حقيقي، لتجنّب إغلاق الحساب لاحقًا.",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 24.h),
            CustomTextFormField(
              prefixIcon: const Icon(CupertinoIcons.lock),
              hintText: "كلمة المرور",
              textEditingController: _passwordController,
              iconShow: true,
              validator: (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 24.h),

            PrivacyPolicyWithCheck(),
            SizedBox(height: 30.h),
            SizedBox(height: 48.h),
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
