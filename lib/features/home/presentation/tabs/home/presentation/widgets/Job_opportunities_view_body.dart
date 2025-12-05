import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/get_all_opportunities_view_model/get_all_opportunities_view_model_states.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/job_seeker_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import '../manager/jobs/get_all_opportunities_view_model/get_all_opportunities_view_model.dart';
import '../widgets/custom_search_bar.dart';
import 'Job_seeker_card_list.dart';
import 'banner_section.dart';
import 'banner_section_for_opportunities_and_jobs.dart';
import 'jobs_header.dart';


class JobOpportunitiesViewBody extends StatelessWidget {
  const JobOpportunitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JobsHeader(
          searchHint: "فرص عمل بالشام",
          onChanged: (value) {
            context.read<GetAllOpportunitiesViewModel>().searchOpportunities(value);
          },
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all( 16.w),
              child: Column(
                children: [

                  BannerSectionForOpportunitiesAndJobs(position: "opportunities"),

                  SizedBox(height: 16.h),

                  /// ⭐ قائمة الوظائف
                  BlocBuilder<
                      GetAllOpportunitiesViewModel,
                      GetAllOpportunitiesViewModelStates
                  >(
                    builder: (context, state) {
                      if (state is GetAllOpportunitiesViewModelLoading) {
                        return ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, __) => const JobSeekerCardSkeleton(),
                        );
                      }

                      if (state is GetAllOpportunitiesViewModelSuccess) {
                        if (state.jobs.isEmpty) {
                          return Center(
                            child: SizedBox(
                              height: 350.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset("assets/lottie/Loading.json",
                                      height: 200.h, width: 200.w),
                                  const SizedBox(height: 16),
                                  const Text(
                                    "لا يوجد فرص عمل حالياً",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return JobSeekerCardList(
                          jobs: state.jobs,
                          position: "opportunities",
                        );
                      }

                      return ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, __) => const JobSeekerCardSkeleton(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}