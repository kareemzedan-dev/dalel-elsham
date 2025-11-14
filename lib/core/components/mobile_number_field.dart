import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets_manager.dart';
import '../utils/colors_manager.dart';

class MobileNumberField extends StatelessWidget {
  const MobileNumberField({
    super.key,
    required this.controller,
    this.hintText = "رقم الموبايل",
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          /// علم الدولة
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.asset(
              AssetsManager.syria,
              width: 32.w,
              height: 22.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 8.w),

          /// كود الدولة
          Text(
            "+963",
            style: TextStyle(
              fontSize: 15.sp,
              color: ColorsManager.black.withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(width: 12.w),

          /// خط فاصل
          Container(
            width: 1,
            height: 25.h,
            color: Colors.grey.shade300,
          ),

          SizedBox(width: 12.w),

          /// TextField للرقم
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              onChanged: onChanged,
              style: TextStyle(
                fontSize: 15.sp,
                color: ColorsManager.black.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
