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
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobs.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              BlocProvider(
                create: (context) =>
                    getIt<GetBannersByPositionViewModel>()
                      ..getBannersByPosition(position),
                child:
                    BlocBuilder<
                      GetBannersByPositionViewModel,
                      GetBannersByPositionViewModelStates
                    >(
                      builder: (context, state) {
                        if (state
                            is GetBannersByPositionViewModelStatesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetBannersByPositionViewModelStatesError) {
                          return const SizedBox.shrink();
                        }

                        if (state
                            is GetBannersByPositionViewModelStatesSuccess) {
                          if (state.banners.isEmpty) {
                            return const SizedBox.shrink(); // 👈 مهم جداً
                          }
                          return BannerSection(images: state.banners);
                        }

                        return const SizedBox.shrink();
                      },
                    ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        }

        final cardIndex = index - 1;
        final bool showBanner = (cardIndex + 1) % 5 == 0;

        return Column(
          children: [
            JobSeekerCard(job: jobs[cardIndex]),
            if (showBanner) ...[
              SizedBox(height: 16.h),
              BlocProvider(
                create: (context) =>
                    getIt<GetBannersByPositionViewModel>()
                      ..getBannersByPosition(position),
                child:
                    BlocBuilder<
                      GetBannersByPositionViewModel,
                      GetBannersByPositionViewModelStates
                    >(
                      builder: (context, state) {
                        if (state
                            is GetBannersByPositionViewModelStatesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is GetBannersByPositionViewModelStatesError) {
                          return const SizedBox.shrink();
                        }
                        if (state
                            is GetBannersByPositionViewModelStatesSuccess) {
                          if (state.banners.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return BannerSection(images: state.banners);
                        }

                        return const SizedBox.shrink();
                      },
                    ),
              ),
            ],
            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}
