import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child:   Center(
          child: Text(
            text,
            style:  Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 16.sp),
          ),
        ),

      ),
    );
  }
}
