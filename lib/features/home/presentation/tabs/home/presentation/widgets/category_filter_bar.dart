import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilterBar extends StatelessWidget {
  const CategoryFilterBar({super.key, required this.categoriesList});

  final List<String> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return CategoryFilterItem(title: categoriesList[index]);
        },
      ),
    );
  }
}

class CategoryFilterItem extends StatelessWidget {
  const CategoryFilterItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.5),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
