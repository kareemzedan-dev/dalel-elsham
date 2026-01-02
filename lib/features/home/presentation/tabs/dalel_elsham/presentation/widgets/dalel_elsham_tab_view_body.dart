import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/di/di.dart';
import '../../../home/presentation/widgets/skeletons/place_card_shimmer.dart';
import '../manager/get_all_place_categories_view_model/get_all_place_categories_view_model.dart';
import '../manager/get_all_place_categories_view_model/get_all_place_categories_view_model_states.dart';
import '../manager/get_all_places_by_category_view_model/get_all_places_by_category_view_model.dart';
import '../manager/get_all_places_by_category_view_model/get_all_places_by_category_states.dart';
import 'category_place_section.dart';
import 'featured_place_card.dart';

class DalelElshamTabViewBody extends StatefulWidget {
  const DalelElshamTabViewBody({super.key});

  @override
  State<DalelElshamTabViewBody> createState() =>
      _DalelElshamTabViewBodyState();
}

class _DalelElshamTabViewBodyState extends State<DalelElshamTabViewBody> {
  String? selectedCategoryId;
  bool _loadedFirstCategory = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ================== التصنيفات ==================
              BlocBuilder<
                  GetAllPlaceCategoriesViewModel,
                  GetAllPlaceCategoriesViewModelStates>(
                builder: (context, state) {
                  if (state is GetAllPlaceCategoriesViewModelStatesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is GetAllPlaceCategoriesViewModelStatesSuccess) {

                    /// ⭐ تحميل أول كاتيجوري مرة واحدة فقط
                    if (!_loadedFirstCategory &&
                        state.categories.isNotEmpty) {

                      _loadedFirstCategory = true;
                      selectedCategoryId = state.categories.first["id"];

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context
                            .read<GetAllPlacesByCategoryViewModel>()
                            .getAllPlacesByCategory(selectedCategoryId!);
                      });
                    }

                    return CategoryPlaceSection(
                      selectedCategoryId: selectedCategoryId,
                      categories: state.categories,
                      onCategorySelected: (categoryId) {
                        setState(() {
                          selectedCategoryId = categoryId;
                        });

                        context
                            .read<GetAllPlacesByCategoryViewModel>()
                            .getAllPlacesByCategory(categoryId);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),

              SizedBox(height: 16.h),

              /// ================== الأماكن + البانرات ==================
              BlocProvider(
                create: (_) => getIt<GetBannersByPositionViewModel>()
                  ..getBannersByPosition("dalel_al_sham"),
                child: BlocBuilder<
                    GetBannersByPositionViewModel,
                    GetBannersByPositionViewModelStates>(
                  builder: (context, bannerState) {
                    return BlocBuilder<
                        GetAllPlacesByCategoryViewModel,
                        GetAllPlacesByCategoryStates>(
                      builder: (context, placeState) {

                        if (placeState is GetAllPlacesByCategoryLoading ||
                            bannerState
                            is GetBannersByPositionViewModelStatesLoading) {
                          return Center(
                            child: PlaceListShimmer(),
                          );
                        }

                        if (placeState is GetAllPlacesByCategorySuccess &&
                            bannerState
                            is GetBannersByPositionViewModelStatesSuccess) {

                          final places = placeState.places;
                          final banners = bannerState.banners;

                          /// ❌ لا يوجد محتوى
                          if (places.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(top: 50.h),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      AssetsManager.wait,
                                      height: 250.h,
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      "نحن نعمل علي هذا القسم\nقريبًا سيتوفر لكم...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            itemCount: places.length + 1,
                            itemBuilder: (context, index) {

                              /// 🔹 أول بانر
                              if (index == 0) {
                                return banners.isNotEmpty
                                    ? SponsoredBanner(
                                  image:
                                  banners.first.imageUrl,
                                )
                                    : const SizedBox();
                              }

                              final placeIndex = index - 1;

                              /// 🔹 بانر كل 10 أماكن
                              if (placeIndex > 0 &&
                                  placeIndex % 10 == 0 &&
                                  banners.isNotEmpty) {

                                final banner =
                                banners[(placeIndex ~/ 10) %
                                    banners.length];

                                return Column(
                                  children: [
                                    SponsoredBanner(
                                      image: banner.imageUrl,
                                    ),
                                    SizedBox(height: 12.h),
                                    FeaturedPlaceCard(
                                      place:
                                      places[placeIndex],
                                    ),
                                  ],
                                );
                              }

                              return FeaturedPlaceCard(
                                place: places[placeIndex],
                              );
                            },
                          );
                        }

                        return PlaceListShimmer();
                      },
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
