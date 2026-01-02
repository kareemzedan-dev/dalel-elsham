import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manager.dart';

class ContactButtonCard extends StatelessWidget {
  const ContactButtonCard({super.key, required this.image,   this.onTap, this.color, this.height, this.width});

  final String image;
  final VoidCallback? onTap;
  final Color? color;
  final double 
   ? height, width;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:  40.h,
        width:   40.w,
        decoration: BoxDecoration(
          color: color ?? ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Image(
            image: AssetImage(image),
            color: Colors.white,
            height: 24.h,
            width: 24.w,
                 
          ),
        ),
      ),
    );
  }
}
