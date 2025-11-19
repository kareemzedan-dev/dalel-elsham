import 'package:dalel_elsham/core/components/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/cache/shared_preferences.dart';
import 'drawer_header_section.dart';
import 'drawer_item.dart';
import 'logout_button.dart';
import 'modal_bottom_sheet_content.dart';

class DrawerContent extends StatefulWidget {
  DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  @override
  void initState() {
    super.initState();
    loadAuthToken();
  }

  String? authToken;

  Future<void> loadAuthToken() async {
    final token = SharedPrefHelper.getString("auth_token");
    setState(() {
      authToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const DrawerHeaderSection(),

          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 16.h),
              children: [
                DrawerItem(
                  icon: Icons.campaign,
                  title: 'أعلن معنا',
                  onTap: () {
                    if (authToken != null && authToken!.isNotEmpty) {
                      Navigator.pushNamed(context, RoutesManager.addNewService);
                      return;
                    }


                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => const ModalBottomSheetContent(),
                    );
                  },
                ),
                DrawerItem(icon: Icons.share, title: 'مشاركة الدليل'),
                DrawerItem(icon: Icons.star_rate, title: 'تقييمك للتطبيق'),
                DrawerItem(icon: Icons.phone_in_talk, title: 'اتصل بنا'),
                DrawerItem(icon: Icons.settings, title: 'الإعدادات'),
              ],
            ),
          ),
          if(authToken != null && authToken!.isNotEmpty)

          LogoutButton(
            onTap: () {
              showConfirmationDialog(
                context: context,
                title: 'تسجيل الخروج',
                message: 'هل أنت متأكد من تسجيل الخروج؟',
                onConfirm: () {
                  SharedPrefHelper.clear();
                  Navigator.pushNamed(context, RoutesManager.home);
                },
              );
            },
          ),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
