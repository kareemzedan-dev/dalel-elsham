import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/cache/shared_preferences.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class DrawerHeaderSection extends StatelessWidget {
  const DrawerHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final userName = SharedPrefHelper.getString("user_name");
    final userAvatar = SharedPrefHelper.getString("avatar_path");
    final displayName = (userName != null && userName.length > 20)
        ? userName.substring(0, 20) + "..."
        : userName;

    return Container(
      height: 180.h + topPadding,
      width: double.infinity,
      padding: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userAvatar == null
              ? CircleAvatar(
            radius: 38.r,
            backgroundColor: isDark ? Colors.grey.shade800 : Colors.white,
            child: Icon(
              Icons.person,
              color: ColorsManager.primaryColor,
              size: 38.sp,
            ),
          )
              : CircleAvatar(
            radius: 38.r,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                userAvatar,
                width: 76.w,
                height: 76.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person, size: 38.sp, color: ColorsManager.primaryColor);
                },
              ),
            ),
          ),

          SizedBox(height: 12.h),
          userName != null
              ? Text(
                  'مرحبًا بك $displayName 👋',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                  maxLines: 1,
                )
              : Text(
                  'مرحبًا بك  👋',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }
}
