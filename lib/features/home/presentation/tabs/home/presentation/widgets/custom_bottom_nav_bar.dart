import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_fab_notched_shape.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: BottomAppBar(
          shape:   CustomFABNotchedShape(),
          notchMargin: 8,
          elevation: 8,

          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,



          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: FontAwesomeIcons.house,
                label: 'الرئيسيه',
                isActive: currentIndex == 0,
                onTap: () => onItemTapped(0),
                context: context,
              ),
              const SizedBox(width: 40),
              _buildNavItem(
                icon: FontAwesomeIcons.mapLocation,
                label: 'دليل الشام',
                isActive: currentIndex == 1,
                onTap: () => onItemTapped(1),
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: isActive ? ColorsManager.primaryColor : Colors.grey,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: isActive
                    ? ColorsManager.primaryColor
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
