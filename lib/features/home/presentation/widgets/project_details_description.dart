import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetailsDescription extends StatelessWidget {
  const ProjectDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(thickness: 1.w, color: Colors.grey),
        SizedBox(height: 8.h),
        Text(
          "تفاصيل المشروع",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
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
      ],
    );
  }
}
