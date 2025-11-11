import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import 'category_item.dart';

class CategoryItemList extends StatelessWidget {
    CategoryItemList({super.key});

  final List<Map<String, String>> categoriesList = [
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final category = categoriesList[index];
          return CategoryItem(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.categoriesDetails);
            },
            image: category["image"]!,
            title: category["title"]!,
          );
        },
      ),
    );
  }
}
