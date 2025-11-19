import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/jobs/get_all_opportunities_view_model/get_all_opportunities_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../manager/jobs/get_all_opportunities_view_model/get_all_opportunities_view_model.dart';
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
              child: BlocProvider(
                create: (context) =>
                    getIt<GetAllOpportunitiesViewModel>()
                      ..getAllOpportunities(),
                child:
                    BlocBuilder<
                      GetAllOpportunitiesViewModel,
                      GetAllOpportunitiesViewModelStates
                    >(
                      builder: (context, state) {
                        if (state is GetAllOpportunitiesViewModelLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetAllOpportunitiesViewModelSuccess) {
                          return JobSeekerCardList(jobs: state.jobs, position: "opportunities",);
                        } else {
                          return const Center(
                            child: Text("حدث خطا ما"),
                          );
                        }
                      },
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
