import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class ProjectDetailsFooter extends StatelessWidget {
  const ProjectDetailsFooter({super.key, required this.onLocationTab, required this.onPhoneTab,required this.showPhoneButton,required this.showLocationButton});
  final VoidCallback onLocationTab;
  final VoidCallback onPhoneTab;
  final bool showPhoneButton,showLocationButton;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsManager.grey,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, bottom: 30, left: 16,top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:   [
            if (showLocationButton)
            _FooterButton(
              icon: Icons.location_on_outlined,
              label: "الموقع",
              backgroundColor: ColorsManager.primaryColor,
              iconColor: Colors.white,
              onTap:  onLocationTab,

            ),
            if (showPhoneButton)

            _FooterButton(
              icon: Icons.phone,
              label: "الاتصال",
              backgroundColor: Colors.blue,
              iconColor: Colors.white,
              onTap: onPhoneTab,
            ),
          ],
        ),
      ),

    );
  }
}

class _FooterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;
  final Color iconColor;

  const _FooterButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: 22.sp),
            SizedBox(width: 6.w),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
