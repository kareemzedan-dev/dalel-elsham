import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/presentation/tabs/home/domain/entities/category_entity.dart';

class CategoryDropdownWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final List<CategoryEntity> categories;
  final CategoryEntity? selectedValue;
  final Function(CategoryEntity?) onChanged;
  final VoidCallback? onTap;

  const CategoryDropdownWidget({
    super.key,
    required this.categories,
    required this.onChanged,
    this.onTap,
    this.label,
    this.hintText = "اختر الفئة",
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<CategoryEntity>(
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

              onTap: onTap,

              items: categories
                  .map(
                    (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name, style: TextStyle(fontSize: 14.sp)),
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
