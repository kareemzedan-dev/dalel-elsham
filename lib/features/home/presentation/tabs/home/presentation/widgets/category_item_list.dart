import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/routes_manager.dart';
import '../../domain/entities/category_entity.dart';
import 'category_item.dart';

class CategoryItemList extends StatelessWidget {
  const CategoryItemList({
    super.key,
    required this.categoriesList,
  });

  final List<CategoryEntity> categoriesList;

  @override
  Widget build(BuildContext context) {
    final sortedList = [...categoriesList]
      ..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));

    final double itemWidth = 100.w;
    final double itemHeight = 100.h;

    return SizedBox(
      height: itemHeight * 3 + 20.h, // 3 صفوف
      child: Stack(
        children: [
          GridView.count(
            crossAxisCount: 3, // ⭐ نفس طريقة العرض فوق
            scrollDirection: Axis.horizontal,
            childAspectRatio: itemWidth / itemHeight,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            children: sortedList.map((category) {
              return CategoryItem(
                image: category.imageUrl,
                title: category.name,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesManager.categoriesDetails,
                    arguments: {
                      "categoryId": category.id,
                      "categoryName": category.name,
                    },
                  );
                },
              );
            }).toList(),
          ),

          /// ⭐ Fade يمين
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 35.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0.2),
                    Colors.white,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Icon(Icons.keyboard_arrow_right,
                  color: Colors.black45, size: 24.sp),
            ),
          ),

          /// ⭐ Fade شمال
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 35.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Icon(Icons.keyboard_arrow_left,
                  color: Colors.black45, size: 24.sp),
            ),
          ),
        ],
      ),
    );
  }
}
