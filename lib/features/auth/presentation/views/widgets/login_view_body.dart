import 'package:dalel_elsham/features/auth/presentation/manager/login_view_model/login_view_model.dart';
import 'package:dalel_elsham/features/auth/presentation/manager/login_view_model/login_view_model_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_text_field.dart';
import '../../../../../core/components/dismissible_error_card.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../../config/routes/routes_manager.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, LoginViewModelStates>(
      listener: (context, state) {
        if (state is LoginViewModelStatesError) {
          showTemporaryMessage(context, state.message, MessageType.error);
        }

        if (state is LoginViewModelStatesSuccess) {
          showTemporaryMessage(
            context,
            "تم تسجيل الدخول بنجاح ✔",
            MessageType.success,
          );

          // بعد تسجيل الدخول
          Navigator.pushReplacementNamed(context, RoutesManager.home);
        }
      },

      builder: (context, state) {
        final isLoading = state is LoginViewModelStatesLoading;

        return Stack(
          children: [
            /// *******************************
            ///             UI FORM
            /// *******************************
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                autovalidateMode: autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    Center(
                      child: Text(
                        "مرحبًا بعودتك 👋",
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
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
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2.w,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            AssetsManager.loginImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 32.h),

                    /// =============== Email
                    CustomTextFormField(
                      prefixIcon: const Icon(CupertinoIcons.mail),
                      hintText: "البريد الإلكتروني",
                      textEditingController: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) => v!.isEmpty ? "البريد مطلوب" : null,
                    ),

                    SizedBox(height: 24.h),

                    /// =============== Password
                    CustomTextFormField(
                      prefixIcon: const Icon(CupertinoIcons.lock),
                      hintText: "كلمة المرور",
                      textEditingController: _password,
                      iconShow: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (v) =>
                          v!.isEmpty ? "كلمة المرور مطلوبة" : null,
                    ),

                    SizedBox(height: 50.h),

                    /// =============== Login Button
                    CustomButton(
                      text: isLoading ? "جاري تسجيل الدخول..." : "تسجيل الدخول",
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginViewModel>().login(
                                  email: _email.text.trim(),
                                  password: _password.text.trim(),
                                );
                              } else {
                                setState(
                                  () => autoValidate =
                                      AutovalidateMode.onUserInteraction,
                                );
                              }
                            },
                    ),

                    SizedBox(height: 12.h),

                    /// =============== Create Account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لا تملك حسابًا؟",
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            RoutesManager.register,
                          ),
                          child: Text(
                            "إنشاء حساب",
                            style: TextStyle(
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
            ),

            /// *******************************
            ///        FULL PAGE LOADING
            /// *******************************
            if (isLoading)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.35),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
