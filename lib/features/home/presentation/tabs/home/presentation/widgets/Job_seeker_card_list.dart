import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../dalel_elsham/presentation/widgets/sponsored_banner.dart';
import '../../domain/entities/job_entity.dart';
import 'Job_seeker_card.dart';
class JobSeekerCardList extends StatelessWidget {
  const JobSeekerCardList({super.key, required this.jobs});
  final List<JobEntity> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobs.length + 1, // +1 للبانر الأول
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

        final cardIndex = index - 1; // 👈 أول Job يبدأ من هنا
        final bool showBanner = (cardIndex + 1) % 5 == 0;

        return Column(
          children: [
            JobSeekerCard(
              job: jobs[cardIndex], // 👈 هنا كانت المشكلة
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
