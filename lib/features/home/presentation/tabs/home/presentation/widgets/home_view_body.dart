import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/projects_list.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/section_widget.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/services_section.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/top_bar_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import 'banner_section.dart';
import 'categories_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBarSection(),
              SizedBox(height: 30.h),
              BlocProvider(
                create: (context) =>
                    getIt<GetBannersByPositionViewModel>()
                      ..getBannersByPosition("home"),
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
                        if (state
                            is GetBannersByPositionViewModelStatesSuccess) {
                          return BannerSection(images: state.banners);
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
              ),
              SizedBox(height: 30.h),
              //  CategoriesSection(),
              SectionWidget(title: "عناصر مميزه", child: ProjectsList()),
              SizedBox(height: 30.h),
              ServicesSection(),
              SizedBox(height: 30.h),
              SectionWidget(title: "نورونا جديد", child: ProjectsList()),
            ],
          ),
        ),
      ),
    );
  }
}
