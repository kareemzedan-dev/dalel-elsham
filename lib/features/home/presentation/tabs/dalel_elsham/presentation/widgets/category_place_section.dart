import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors_manager.dart';
class CategoryPlaceSection extends StatelessWidget {
  const CategoryPlaceSection({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.selectedCategoryId,
  });

  final List<Map<String, dynamic>> categories;
  final Function(String) onCategorySelected;
  final String? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategoryId == category["id"];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                onCategorySelected(category["id"]);
              },
              child: CategoryPlaceItem(
                title: category["name"],
                isSelected: isSelected,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryPlaceItem extends StatelessWidget {
  const CategoryPlaceItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical:4.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.primaryColor.withOpacity(0.2)
              : ColorsManager.grey.withOpacity(0.4),
          border: Border.all(
            color: isSelected ? ColorsManager.primaryColor : ColorsManager.grey,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            title,
            softWrap: false,
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isSelected ? ColorsManager.primaryColor : ColorsManager.black,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
