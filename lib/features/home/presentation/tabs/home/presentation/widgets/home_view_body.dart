import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/di/di.dart';

import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import '../manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model_states.dart';

import '../manager/categories/get_all_categories_view_model/get_all_categories_view_model.dart';
import '../manager/categories/get_all_categories_view_model/get_all_categories_view_model_states.dart';

import '../manager/project_display_section_view_model/get_all_project_display_sections_view_model/get_all_project_display_sections_view_model.dart';
import '../manager/project_display_section_view_model/get_all_project_display_sections_view_model/get_all_project_display_sections_view_model_states.dart';

import '../manager/projects/get_projects_by_display_section_view_model/get_projects_by_display_section_view_model.dart';
import '../manager/projects/get_projects_by_display_section_view_model/get_projects_by_display_section_view_model_states.dart';

import '../manager/projects/get_newest_projects_view_model/get_newest_projects_view_model.dart';
import '../manager/projects/get_newest_projects_view_model/get_newest_projects_view_model_states.dart';

import 'banner_section.dart';
import 'categories_section.dart';
import 'top_bar_section.dart';
import 'services_section.dart';
import 'section_widget.dart';
import 'projects_list.dart';

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
              const TopBarSection(),
              SizedBox(height: 30.h),

              /// ---------------- BANNERS ----------------
              _buildHomeBanners(),

              SizedBox(height: 30.h),

              /// ---------------- DISPLAY SECTIONS ----------------
              BlocProvider(
                create: (_) => getIt<GetAllProjectDisplaySectionsViewModel>()
                  ..getAllProjectDisplaySections(),
                child: BlocBuilder<
                    GetAllProjectDisplaySectionsViewModel,
                    GetAllProjectDisplaySectionsViewModelStates>(
                  builder: (context, state) {
                    if (state
                    is GetAllProjectDisplaySectionsViewModelLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state
                    is GetAllProjectDisplaySectionsViewModelSuccess) {
                      final sections = state.projectDisplaySections;

                      if (sections.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      final firstSection = sections.first;
                      final others = sections.skip(1).toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// ---------------- CATEGORIES ----------------
                          _buildCategories(),

                          SizedBox(height: 30.h),

                          /// ----- FIRST SECTION UNDER CATEGORIES -----
                          _buildProjectSection(firstSection.id, firstSection.title),

                          SizedBox(height: 30.h),

                          /// ---------------- SERVICES ----------------
                          const ServicesSection(),

                          SizedBox(height: 30.h),

                          /// ---------------- NEWEST PROJECTS ----------------
                          _buildNewestProjects(),

                          SizedBox(height: 30.h),

                          /// ----- REMAINING SECTIONS -----
                          ...others.map(
                                (section) => Padding(
                              padding: EdgeInsets.only(bottom: 30.h),
                              child: _buildProjectSection(
                                section.id,
                                section.title,
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ==========================================================
  ///                  REFACTORED HELPERS
  /// ==========================================================

  Widget _buildHomeBanners() {
    return BlocProvider(
      create: (_) => getIt<GetBannersByPositionViewModel>()
        ..getBannersByPosition("home"),
      child: BlocBuilder<GetBannersByPositionViewModel,
          GetBannersByPositionViewModelStates>(
        builder: (context, state) {
          if (state is GetBannersByPositionViewModelStatesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetBannersByPositionViewModelStatesSuccess) {
            return BannerSection(images: state.banners);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildCategories() {
    return BlocProvider(
      create: (_) => getIt<GetAllCategoriesViewModel>()..getAllCategories(),
      child: BlocBuilder<GetAllCategoriesViewModel,
          GetAllCategoriesViewModelStates>(
        builder: (context, state) {
          if (state is GetAllCategoriesViewModelLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetAllCategoriesViewModelSuccess) {
            return CategoriesSection(categoriesList: state.categories);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildNewestProjects() {
    return SectionWidget(
      title: "نورونا جديد",
      child: BlocProvider(
        create: (_) => getIt<GetNewestProjectsViewModel>()
          ..getNewestProjects(),
        child: BlocBuilder<GetNewestProjectsViewModel,
            GetNewestProjectsViewModelStates>(
          builder: (context, state) {
            if (state is GetNewestProjectsViewModelLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetNewestProjectsViewModelSuccess) {
              return ProjectsList(projects: state.projects);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildProjectSection(String id, String title) {
    return SectionWidget(
      title: title,
      child: BlocProvider(
        create: (_) => getIt<GetProjectsByDisplaySectionViewModel>()
          ..getProjectsByDisplaySection(id),
        child: BlocBuilder<GetProjectsByDisplaySectionViewModel,
            GetProjectsByDisplaySectionViewModelStates>(
          builder: (context, state) {
            if (state is GetProjectsByDisplaySectionViewModelStatesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state
            is GetProjectsByDisplaySectionViewModelStatesSuccess) {
              if (state.projects.isEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Center(
                    child: Text(
                      "لا يوجد مشاريع متاحة في هذا القسم حالياً",
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                  ),
                );
              }

              return ProjectsList(projects: state.projects);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
