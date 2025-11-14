import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final VoidCallback? onBack;
  final bool showWatch;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.showBackButton = true,
    this.onBack,
    this.showWatch = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.primaryColor,
      elevation: 0,
      centerTitle: centerTitle,


      actions: [
        if (showWatch)
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Row(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                  size: 20.sp,
                ),
                SizedBox(width: 4.w),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "12",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],

      leading: showBackButton
          ? IconButton(
        icon:   Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.sp),
        onPressed: onBack ?? () => Navigator.pop(context),
      )
          : null,

      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
