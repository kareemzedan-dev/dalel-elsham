import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../dalel_elsham/presentation/widgets/sponsored_banner.dart';
import '../../domain/entities/job_entity.dart';
import 'Job_seeker_card.dart';
import 'banner_every5.dart';
import 'banner_section.dart';

class JobSeekerCardList extends StatelessWidget {
  const JobSeekerCardList({
    super.key,
    required this.jobs,
    required this.position,
  });

  final List<JobEntity> jobs;
  final String position;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            JobSeekerCard(job: jobs[index]),

            /// ⭐ بانر كل 5 عناصر
            if ((index + 1) % 5 == 0) ...[
              SizedBox(height: 16.h),
              BannerEvery5(position: position),
            ],

            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}