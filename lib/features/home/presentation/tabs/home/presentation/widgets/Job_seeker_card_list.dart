import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'Job_seeker_card.dart';

class JobSeekerCardList extends StatelessWidget {
  const JobSeekerCardList({super.key});

  @override
  Widget build(BuildContext context) {
    // عدد العناصر الأساسية (الكروت)
    const int itemCount = 10;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        // ✅ أول عنصر بانر
        if (index == 0) {
          return Column(
            children: [
              SponsoredBanner(image: AssetsManager.banner),
              SizedBox(height: 16.h),
            ],
          );
        }

        // ✅ الكارت الحالي
        final cardIndex = index - 1;
        final bool showBanner = (cardIndex + 1) % 5 == 0;

        return Column(
          children: [
            const JobSeekerCard(
              name: "محمد القاسم",
              description:
              "ابحث عن عمل كمصمم جرافيك، لدي خبرة 4 سنوات في تصميم الشعارات والإعلانات.",
              location: "دمشق",
              date: "12/11/2025",
              imagePath: AssetsManager.person,
            ),
            if (showBanner) ...[
              SizedBox(height: 16.h),
              SponsoredBanner(image: AssetsManager.banner),
            ],
            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}
