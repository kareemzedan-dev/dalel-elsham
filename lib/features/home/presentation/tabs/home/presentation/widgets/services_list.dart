import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import 'service_item.dart';


class ServicesList extends StatelessWidget {
  ServicesList({super.key});

  final List<Map<String, dynamic>> servicesList = [
    {
      "image": AssetsManager.service1,
      "title": "مواقيت الصلاة",
      "route": RoutesManager.prayerTimes, // اسم الصفحة
    },
    {
      "image": AssetsManager.service2,
      "title": "ابحث عن عمل",
      "route": RoutesManager.jobSeekers, // صفحة الباحثين عن عمل
    },
    {
      "image": AssetsManager.service3,
      "title": "فرص عمل",
      "route": RoutesManager.jobOpportunities,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: servicesList.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final service = servicesList[index];
          return ServiceItem(
            image: service["image"]!,
            title: service["title"]!,
            onTap: () {
              // ✅ التنقل عند الضغط على الخدمة
              Navigator.pushNamed(context, service["route"]);
            },
          );
        },
      ),
    );
  }
}
