import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomServiceContainer extends StatelessWidget {
  const CustomServiceContainer({super.key, required this.image, this.onTap, this.isSoon = false});
  final String image;
  final VoidCallback? onTap;
  final bool isSoon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.grey,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: ColorsManager.black.withOpacity(.2),
                width: 1.w,
              ),
            ),
            child: Image.asset(image, height: 100.h, width: 100.w, fit: BoxFit.cover),
          ),
          if(isSoon)
           Positioned(
            top:4,
 
            right:5,
          
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'قريبا 💥',
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
