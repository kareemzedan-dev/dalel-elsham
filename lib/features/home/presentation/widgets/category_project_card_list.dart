import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_project_card.dart';

class CategoryProjectCardList extends StatelessWidget {
  const CategoryProjectCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CategoryProjectCard(
          title: "المشروع الأول",
          description: "وصف المشروع",
          location: "الموقع",
        );
      },
    );
  }
}
