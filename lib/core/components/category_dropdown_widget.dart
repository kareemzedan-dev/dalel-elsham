import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDropdownWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final List<String> categories;
  final String? selectedValue;
  final Function(String?) onChanged;

  const CategoryDropdownWidget({
    super.key,
    required this.categories,
    required this.onChanged,
    this.label,
    this.hintText = "اختر الفئة",
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // -------- Label --------
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 6.h),
        ],

        // -------- Dropdown --------
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text(
                hintText!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade700),

              items: categories
                  .map(
                    (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              )
                  .toList(),

              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
