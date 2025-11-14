import 'package:dalel_elsham/config/routes/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_project_card.dart';

class CategoryProjectCardList extends StatelessWidget {
  const CategoryProjectCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projects = [
      {
        "title": "مطعم الشام الأصيل",
        "description": "أشهى المأكولات السورية مع جلسات عائلية مريحة وخدمة ممتازة.",
        "location": "دمشق - المزة"
      },
      {
        "title": "مقهى أرابيسك",
        "description": "مقهى حديث يقدم المشروبات الساخنة والباردة مع أجواء مميزة.",
        "location": "دمشق - أبو رمانة"
      },
      {
        "title": "حلويات الفقير",
        "description": "حلويات شرقية وغربية طازجة يوميًا، بجودة عالية وأسعار مناسبة.",
        "location": "دمشق - الحميدية"
      },
      {
        "title": "متجر الأناقة للملابس",
        "description": "أحدث صيحات الموضة الرجالية والنسائية بأسعار منافسة.",
        "location": "دمشق - شارع الحمرا"
      },
      {
        "title": "مكتبة النجاح",
        "description": "كل ما تحتاجه من أدوات مدرسية وجامعية وخدمات طباعة وتصوير.",
        "location": "دمشق - باب توما"
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return CategoryProjectCard(
          onTap: () {
            Navigator.pushNamed(context, RoutesManager.projectDetails);
          },
          title: project["title"]!,
          description: project["description"]!,
          location: project["location"]!,
        );
      },
    );
  }
}
