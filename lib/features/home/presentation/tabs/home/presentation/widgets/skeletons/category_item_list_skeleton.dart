import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item_skeleton.dart';

class CategoryItemListSkeleton extends StatelessWidget {
  const CategoryItemListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    const int maxItemsPerRow = 17;

    // افتراضياً نكرر 34 عنصر (صفّين × 17)
    final dummyList = List.generate(34, (_) => 0);

    // نفس تقسيمة الـ chunk
    List<List<int>> rows = [];
    for (int i = 0; i < dummyList.length; i += maxItemsPerRow) {
      rows.add(
        dummyList.sublist(
          i,
          (i + maxItemsPerRow > dummyList.length)
              ? dummyList.length
              : i + maxItemsPerRow,
        ),
      );
    }

    // أطول صف
    final columnsCount =
    rows.fold<int>(0, (prev, row) => row.length > prev ? row.length : prev);

    // نفس الأبعاد الأصلية
    final double columnWidth = 90.w;
    final double itemHeight = 90.h;
    final double columnSpacing = 1.w;
    final double itemSpacing = 1.h;

    return SizedBox(
      height: (itemHeight * rows.length) + (itemSpacing * (rows.length - 1)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: isLast ? 0 : itemSpacing,
                        ),
                        child: SizedBox(
                          height: itemHeight,
                          child: const CategoryItemSkeleton(),
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
