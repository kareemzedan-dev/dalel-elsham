import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors_manager.dart';

class ContactButtonCard extends StatelessWidget {
  const ContactButtonCard({super.key, required this.image,   this.onTap});

  final String image;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
          child: Center(
            child: Image(
              image: AssetImage(image),
              color: Colors.white,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
      ),
    );
  }
}
