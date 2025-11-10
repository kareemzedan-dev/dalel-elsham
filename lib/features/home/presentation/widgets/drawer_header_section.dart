import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors_manager.dart';

class DrawerHeaderSection extends StatelessWidget {
  const DrawerHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

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
          CircleAvatar(
            radius: 38.r,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: ColorsManager.primaryColor,
              size: 38.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'مرحبًا بك كريم 👋',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
