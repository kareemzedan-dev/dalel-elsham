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
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},
    {"title": "سيارات", "image": AssetsManager.category2},
    {"title": "مشافي", "image": AssetsManager.category3},
    {"title": "طعام", "image": AssetsManager.category1},


  ];

  List<List<Map<String, String>>> chunk(List<Map<String, String>> list, int maxItemsPerRow) {
    List<List<Map<String, String>>> out = [];
    for (int i = 0; i < list.length; i += maxItemsPerRow) {
      out.add(list.sublist(i, (i + maxItemsPerRow > list.length) ? list.length : i + maxItemsPerRow));
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    const int maxItemsPerRow = 17;
    final rows = chunk(categoriesList, maxItemsPerRow); // صفوف كل واحدة تشمل حتى 17 عنصر
    final int columnsCount = rows.fold<int>(0, (prev, row) => row.length > prev ? row.length : prev); // أطول صف

    final double columnWidth = 90.w;
    final double itemHeight = 90.h;
    final double columnSpacing = 1.w;
    final double itemSpacing = 1.h;

    return SizedBox(
      height: (itemHeight * rows.length) + (itemSpacing * (rows.length - 1)), // ارتفاع كافٍ لعدد الصفوف
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // <-- واحد فقط, يحرك كل شيء
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(columnsCount, (colIndex) {
            return Padding(
              padding: EdgeInsets.only(right: columnSpacing),
              child: SizedBox(
                width: columnWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(rows.length, (rowIndex) {
                    final row = rows[rowIndex];

                    final isLast = rowIndex == rows.length - 1;

                    if (colIndex < row.length) {
                      final category = row[colIndex];
                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0 : itemSpacing),
                        child: SizedBox(
                          height: itemHeight,
                          child: CategoryItem(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesManager.categoriesDetails);
                            },
                            image: category["image"]!,
                            title: category["title"]!,
                          ),
                        ),
                      );
                    }

                    return SizedBox(height: itemHeight);
                  }),

                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
