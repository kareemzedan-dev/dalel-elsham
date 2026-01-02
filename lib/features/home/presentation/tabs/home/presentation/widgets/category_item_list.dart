import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/routes_manager.dart';
import '../../domain/entities/category_entity.dart';
import 'category_item.dart';

class CategoryItemList extends StatefulWidget {
  const CategoryItemList({
    super.key,
    required this.categoriesList,
  });

  final List<CategoryEntity> categoriesList;

  @override
  State<CategoryItemList> createState() => _CategoryItemListState();
}

class _CategoryItemListState extends State<CategoryItemList> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final sortedList = [...widget.categoriesList]
      ..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));

    const int initialCount = 12;
    final itemsToShow =
    showAll ? sortedList : sortedList.take(initialCount).toList();

    return Column(
      children: [
        Stack(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemsToShow.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final category = itemsToShow[index];
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
              },
            ),

            if (!showAll && sortedList.length > initialCount)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 90.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.85),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),

        SizedBox(height: 8.h),

        if (sortedList.length > initialCount)
          GestureDetector(
            onTap: () {
              setState(() => showAll = !showAll);
            },
            child: IntrinsicWidth(
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: ColorsManager.primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      showAll ? "عرض أقل" : "عرض الكل",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      showAll
                          ? Icons.keyboard_double_arrow_up
                          : Icons.keyboard_double_arrow_down,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

