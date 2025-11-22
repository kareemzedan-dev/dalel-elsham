import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors_manager.dart';

class SearchTextField extends StatelessWidget {
  final VoidCallback? onTap;

  const SearchTextField({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1.5.w,
          ),
        ),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.search,
              color: ColorsManager.primaryColor,
            ),
            SizedBox(width: 8.w),
            Text(
              "ابحث عن خدمه، طبيب، مطعم...",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
