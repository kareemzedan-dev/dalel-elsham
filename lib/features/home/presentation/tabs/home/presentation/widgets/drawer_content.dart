import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'drawer_header_section.dart';
import 'drawer_item.dart';
import 'logout_button.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          const DrawerHeaderSection(),

          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 16.h),
              children: const [
                DrawerItem(icon: Icons.campaign, title: 'أعلن معنا'),
                DrawerItem(icon: Icons.share, title: 'مشاركة الدليل'),
                DrawerItem(icon: Icons.star_rate, title: 'تقييمك للتطبيق'),
                DrawerItem(icon: Icons.phone_in_talk, title: 'اتصل بنا'),
                DrawerItem(icon: Icons.settings, title: 'الإعدادات'),
              ],
            ),
          ),

          LogoutButton(onTap: () {
            // TODO: تنفيذ عملية تسجيل الخروج
          }),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
