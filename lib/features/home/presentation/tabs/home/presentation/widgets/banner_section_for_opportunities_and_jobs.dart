
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/banner_section_skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import 'banner_section.dart';

class BannerSectionForOpportunitiesAndJobs extends StatelessWidget {
  const BannerSectionForOpportunitiesAndJobs({Key? key,required this.position}) : super(key: key);
  final String?position ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      getIt<GetBannersByPositionViewModel>()..getBannersByPosition(position!),
      child: BlocBuilder<
          GetBannersByPositionViewModel,
          GetBannersByPositionViewModelStates>(
        builder: (context, state) {
          if (state is GetBannersByPositionViewModelStatesLoading) {
            return BannerSectionSkeleton();
          }

          if (state is GetBannersByPositionViewModelStatesSuccess) {
            if (state.banners.isEmpty) return const SizedBox.shrink();
            return BannerSection(images: state.banners);
          }

          return BannerSectionSkeleton();
        },
      ),
    );
  }
}
