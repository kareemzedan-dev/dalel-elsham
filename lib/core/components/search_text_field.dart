import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_text_styles.dart';
import '../utils/colors_manager.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.5.w),
      ),
      alignment: Alignment.center,
      child: TextField(
        style: AppTextStyles.regular14.copyWith(color: Colors.black),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 0,
          ),
          prefixIcon: Icon(
            CupertinoIcons.search,
            size: 20.sp,
            color: ColorsManager.primaryColor,
          ),
          hintText: 'ابحث عن خدمه، طبيب، مطعم...',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey.shade500),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
