import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../widgets/custom_search_bar.dart';
import 'Job_seeker_card_list.dart';
import 'jobs_header.dart';

class JobOpportunitiesViewBody extends StatelessWidget {
  const JobOpportunitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JobsHeader(searchHint: "فرص عمل بالشام"),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const JobSeekerCardList(),
            ),
          ),
        ),
      ],
    );

  }
}
