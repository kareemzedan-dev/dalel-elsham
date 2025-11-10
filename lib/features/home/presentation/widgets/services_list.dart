import 'package:dalel_elsham/features/home/presentation/widgets/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_manager.dart';

class ServicesList extends StatelessWidget {
    ServicesList({super.key});
  final List<Map<String,String>> servicesList = [
    {
      "image": AssetsManager.service1,
      "title": "مواقيت الصلاه",
    },
    {
      "image": AssetsManager.service2,
      "title": "ابحث عن عمل",
    },
    {
      "image": AssetsManager.service3,
      "title": "فرص عمل",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: servicesList.length,
        shrinkWrap: true, // ✅ مهم عشان يشتغل داخل ScrollView

        itemBuilder: (context, index) {
          return   Padding(
            padding: const EdgeInsets.only(left:  16.0),
            child: ServiceItem(
              image: servicesList[index]["image"]!,
              title: servicesList[index]["title"]!,
            ),
          );
        },
      ),
    );
  }
}
