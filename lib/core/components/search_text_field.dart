import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_text_styles.dart';
import '../utils/colors_manager.dart';
class SearchTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final VoidCallback? onTap;   // 👈 NEW

  const SearchTextField({super.key, this.onChanged, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,   // 👈 مهم
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.5.w),
        ),
        alignment: Alignment.center,
        child: TextField(
          enabled: false,  // 👈 علشان يبقى readOnly ويفتح صفحة البحث
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: ColorsManager.primaryColor,
            ),
            hintText: "ابحث عن خدمه، طبيب، مطعم...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
