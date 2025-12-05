import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets_manager.dart';
import '../utils/colors_manager.dart';

class MobileNumberField extends StatelessWidget {
    MobileNumberField({
    super.key,
    required this.controller,
    this.hintText = "رقم الموبايل",
    this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  String? Function(String?)? validator;


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

          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.asset(
              AssetsManager.country,
              width: 32.w,
              height: 22.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 8.w),

          Text(
            "+963",
            style: TextStyle(
              fontSize: 15.sp,
              color: ColorsManager.black.withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(width: 12.w),


          Container(
            width: 1,
            height: 25.h,
            color: Colors.grey.shade300,
          ),


          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
              onChanged: onChanged,
              validator: validator ,

              style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14.sp,
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
