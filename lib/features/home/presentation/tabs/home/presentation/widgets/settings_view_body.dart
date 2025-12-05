import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ------------------ HEADER ------------------
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
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          SizedBox(height: 30.h),

          /// ------------------ DARK MODE ------------------
          // _buildSectionTitle("المظهر"),
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 12.h),
          //   child: Row(
          //     children: [
          //       Icon(
          //         CupertinoIcons.moon_fill,
          //         size: 22.sp,
          //         color: Colors.grey.shade700,
          //       ),
          //       SizedBox(width: 12.w),
          //       Expanded(
          //         child: Text(
          //           "الوضع الداكن",
          //           style: TextStyle(
          //             fontSize: 15.sp,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //       Switch(
          //         value: isDark,
          //         activeColor: Colors.blue,
          //         onChanged: (value) {
          //           setState(() => isDark = value);
          //           // TODO: apply theme mode
          //         },
          //       ),
          //     ],
          //   ),
          // ),

          SizedBox(height: 25.h),

          /// ------------------ ABOUT & POLICY ------------------
          _buildSectionTitle("معلومات عنا"),

          _buildSettingsItem(
            icon: CupertinoIcons.info_circle,
            title: "من نحن",
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.privacyPolicy, arguments: {
                'title': 'من نحن',
              });
            },
          ),

          _buildSettingsItem(
            icon: CupertinoIcons.doc_text,
            title: "سياسة الاستخدام",
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.privacyPolicy, arguments: {
                'title': 'سياسة الاستخدام',
              });
            },
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  /// ---------- Helpers ----------
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
