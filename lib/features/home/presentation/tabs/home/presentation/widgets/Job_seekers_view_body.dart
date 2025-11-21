import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/get_all_jobs_view_model/get_all_jobs_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/get_all_jobs_view_model/get_all_jobs_view_model_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../core/di/di.dart';

import 'Job_seeker_card_list.dart';
import 'banner_section_for_opportunities_and_jobs.dart';
import 'custom_search_bar.dart';
import 'jobs_header.dart';

class JobSeekersViewBody extends StatelessWidget {
  const JobSeekersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllJobsViewModel>()..getAllJobs(),
      child: Column(
        children: [
          JobsHeader(
            searchHint: "أضف طلب عمل",
            onChanged: (value) {
              context.read<GetAllJobsViewModel>().searchJobs(value);
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    BannerSectionForOpportunitiesAndJobs(
                      position: "job_seekers",
                    ),

                    SizedBox(height: 16.h),

                    BlocBuilder<GetAllJobsViewModel, GetAllJobsViewModelStates>(
                      builder: (context, state) {
                        if (state is GetAllJobsViewModelLoading) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (state is GetAllJobsViewModelSuccess) {
                          if (state.jobs.isEmpty) {
                            return SizedBox(

                              height: 350.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    "assets/lottie/Loading.json",
                                    height: 200.h,
                                    width: 200.w,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "لا يوجد طلبات عمل حالياً",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return JobSeekerCardList(
                            jobs: state.jobs,
                            position: "job_seekers",
                          );
                        }

                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text("حدث خطأ ما"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
