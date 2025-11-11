import 'package:dalel_elsham/core/components/contact_button_card.dart';
import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:dalel_elsham/features/home/presentation/widgets/banner_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors_manager.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            BannerSection(),
            SizedBox(height: 16.h),
            Text(
              "عنوان المشروع",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 24.sp,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(width: 4.w),
                Text(
                  "الشام",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Divider(thickness: 1.w, color: Colors.grey),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContactButtonCard(image: AssetsManager.whatsapp),
                  ContactButtonCard(image: AssetsManager.facebook),
                  ContactButtonCard(image: AssetsManager.instagram),
                  ContactButtonCard(image: AssetsManager.world),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Divider(thickness: 1.w, color: Colors.grey),
            SizedBox(height: 8.h),
            Text(
              "تفاصيل المشروع",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "يُعد هذا المشروع من المبادرات الرائدة التي تهدف إلى دعم أصحاب الأعمال المحليين في مدينة دمشق. نهدف من خلال هذا المشروع إلى توفير منصة تجمع بين الخدمات المختلفة التي يحتاجها المواطنون، سواء كانت مطاعم، متاجر، مراكز طبية أو شركات خدمية، وذلك بطريقة سهلة وسريعة. يتميز المشروع بتصميم عصري وتجربة مستخدم سلسة، تُمكِّن المستخدم من الوصول إلى المعلومات والعروض المتاحة بشكل فوري دون عناء البحث الطويل. كما نسعى لتوسيع نطاق المشروع ليشمل باقي المحافظات قريبًا.",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey, width: 1.w),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 16.sp),
                    SizedBox(width: 8.w),
                    Text(
                      "وقت العمل : من الساعة ٩ صباحًا إلى الساعة ٩ مساءً",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "الصور :",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),

          ],
        ),
      ),
    );
  }
}
