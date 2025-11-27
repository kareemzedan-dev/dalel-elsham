import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/manager/get_all_place_view_model/get_all_place_view_model_states.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/get_all_place_view_model/get_all_place_view_model.dart';
import 'featured_place_card.dart';

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
              /// ============= تحميل البانرات =============
              BlocProvider(
                create: (context) =>
                getIt<GetBannersByPositionViewModel>()
                  ..getBannersByPosition("dalel_al_sham"),
                child: BlocBuilder<
                    GetBannersByPositionViewModel,
                    GetBannersByPositionViewModelStates>(
                  builder: (context, bannerState) {
                    return BlocProvider(
                      create: (context) =>
                      getIt<GetAllPlaceViewModel>()..getAllPlaces(),
                      child: BlocBuilder<GetAllPlaceViewModel,
                          GetAllPlaceViewModelStates>(
                        builder: (context, placeState) {
                          if (placeState is GetAllPlaceViewModelSuccess &&
                              bannerState
                              is GetBannersByPositionViewModelStatesSuccess) {
                            final places = placeState.places;
                            final banners = bannerState.banners;

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: places.length + 1, // +1 لأوّل بانر
                              itemBuilder: (context, index) {

                                /// 🔹 أول بانر في أعلى الصفحة
                                if (index == 0) {
                                  return banners.isNotEmpty
                                      ? SponsoredBanner(
                                    image: banners.first.imageUrl,
                                  )
                                      : const SizedBox();
                                }

                                final placeIndex = index - 1;

                                /// 🔹 بعد كل 5 أماكن بانر تلقائي
                                if (placeIndex > 0 &&
                                    placeIndex % 5 == 0) {
                                  final bannerToShow =
                                  banners[(placeIndex ~/ 5) %
                                      banners.length];

                                  return Column(
                                    children: [
                                      SponsoredBanner(
                                        image: bannerToShow.imageUrl,
                                      ),
                                      SizedBox(height: 12.h),
                                      FeaturedPlaceCard(
                                        place: places[placeIndex],
                                      ),
                                    ],
                                  );
                                }

                                /// 🔹 الكارد العادي
                                return FeaturedPlaceCard(
                                  place: places[placeIndex],
                                );
                              },
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
