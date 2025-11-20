import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/banner_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../manager/get_all_place_view_model/get_all_place_view_model.dart';
import 'featured_place_card.dart';
import 'featured_place_card_list.dart';

class DalelElshamTabViewBody extends StatelessWidget {
  const DalelElshamTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (context) =>
                    getIt<GetBannersByPositionViewModel>()
                      ..getBannersByPosition("dalel_al_sham"),
                child:
                    BlocBuilder<
                      GetBannersByPositionViewModel,
                      GetBannersByPositionViewModelStates
                    >(
                      builder: (context, state) {
                        if (state
                            is GetBannersByPositionViewModelStatesSuccess) {
                          if (state.banners.isNotEmpty) {
                            return SponsoredBanner(
                              image: state.banners.first.imageUrl,
                            );
                          }
                          return const SizedBox();
                        }
                        return const SizedBox();
                      },
                    ),
              ),
              SizedBox(height: 16.h),
              BlocProvider(
                create: (context) =>
                    getIt<GetAllPlaceViewModel>()..getAllPlaces(),

                child: FeaturedPlaceCardList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
