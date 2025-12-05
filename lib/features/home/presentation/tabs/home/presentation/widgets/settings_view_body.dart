import 'package:dalel_elsham/core/cache/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../../../../../auth/presentation/manager/delete_account_view_model/delete_account_view_model.dart';
import '../views/info_page_view.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---------------- HEADER -----------------
          Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundColor: Colors.grey.shade300,
                child: Icon(
                  CupertinoIcons.gear,
                  size: 26.sp,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                "الإعدادات",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
              ),
            ],
          ),

          SizedBox(height: 30.h),

          /// ---------------- ABOUT & TERMS -----------------
          _buildSectionTitle("معلومات عنا"),

          _buildSettingsItem(
            icon: CupertinoIcons.info_circle,
            title: "من نحن",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const InfoPageView(pageType: "about"),
                ),
              );
            },
          ),

          _buildSettingsItem(
            icon: CupertinoIcons.doc_text,
            title: "شروط الاستخدام",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const InfoPageView(pageType: "terms"),
                ),
              );
            },
          ),

          const Spacer(),
          if (SharedPrefHelper.getString("auth_token") != null)
            /// ---------------- DELETE ACCOUNT BUTTON -----------------
            InkWell(
              onTap: () {
                final providerContext = context;
                _showDeleteAccountDialog(providerContext);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.red),
                ),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.delete, size: 22.sp, color: Colors.red),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        "حذف الحساب",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Icon(
                      CupertinoIcons.chevron_back,
                      size: 18.sp,
                      color: Colors.red.shade300,
                    ),
                  ],
                ),
              ),
            ),

          SizedBox(height: 25.h),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  //       DELETE ACCOUNT DIALOG
  // ---------------------------------------------------------------------------
  void _showDeleteAccountDialog(BuildContext providerContext) {
    showDialog(
      context: providerContext,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.delete, color: Colors.red, size: 36.sp),
                SizedBox(height: 12.h),

                Text(
                  "هل أنت متأكد من حذف الحساب؟",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 10.h),

                Text(
                  "سيتم حذف حسابك وجميع بياناتك نهائيًا ولن يمكنك استعادتها.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20.h),

                /// زر حذف
                SizedBox(
                  width: double.infinity,
                  height: 45.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pop(dialogContext);

                      final vm = providerContext.read<DeleteAccountViewModel>();

                      final password = await _askForPassword(providerContext);
                      if (password == null || password.isEmpty) return;

                      try {
                        final user = FirebaseAuth.instance.currentUser!;
                        final cred = EmailAuthProvider.credential(
                          email: user.email!,
                          password: password,
                        );

                        await user.reauthenticateWithCredential(cred);
                      } catch (e) {
                        ScaffoldMessenger.of(providerContext).showSnackBar(
                          SnackBar(
                            content: Text(
                              "كلمة المرور غير صحيحة",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      _showDeletingDialog(providerContext);

                      final result = await vm.deleteAccount();

                      Navigator.pop(providerContext);

                      result.fold(
                        ifLeft: (failure) =>
                            ScaffoldMessenger.of(providerContext).showSnackBar(
                              SnackBar(
                                content: Text(
                                  failure.message,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            ),
                        ifRight: (_) {
                          ScaffoldMessenger.of(providerContext).showSnackBar(
                            SnackBar(
                              content: Text(
                                "تم حذف الحساب بنجاح",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );

                          Navigator.pushReplacementNamed(
                            providerContext,
                            RoutesManager.splash,
                          );
                        },
                      );
                    },

                    child: Text(
                      "حذف الحساب",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                /// زر إلغاء
                SizedBox(
                  width: double.infinity,
                  height: 45.h,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () => Navigator.pop(dialogContext),
                    child: Text(
                      "إلغاء",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  //       LOADING DIALOG
  // ---------------------------------------------------------------------------
  void _showDeletingDialog(BuildContext providerContext) {
    showDialog(
      context: providerContext,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 28.h,
                  width: 28.h,
                  child: const CircularProgressIndicator(color: Colors.red),
                ),
                SizedBox(width: 12.w),
                Text(
                  "جاري حذف الحساب...",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w900,
          color: ColorsManager.primaryColor,
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          children: [
            Icon(icon, size: 22.sp, color: Colors.grey.shade700),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              CupertinoIcons.chevron_back,
              size: 18.sp,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------
/// PASSWORD DIALOG
/// ---------------------------------------------------------
Future<String?> _askForPassword(BuildContext context) async {
  final controller = TextEditingController();

  return showDialog<String>(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(
          "تأكيد كلمة المرور",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "أدخل كلمة المرور لحذف الحساب",
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "إلغاء",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text(
              "تأكيد",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
