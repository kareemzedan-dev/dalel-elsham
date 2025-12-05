import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.image, required this.title, required this.onTap});
  final String image;
  final String title;
  final  VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(

        width: 140.w,
        decoration: BoxDecoration(
          color: isDark  ? ColorsManager.grey.withOpacity(0.5):ColorsManager.grey,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                height: 120.h,
                width: 140.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset( image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w900
                    ,fontSize: 16.sp
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
