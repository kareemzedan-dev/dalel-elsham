import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/banner_section_skeleton.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/category_item_list_skeleton.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/display_sections_skeleton.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/skeletons/project_list_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/utils/colors_manager.dart';
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
import '../views/search_for_projects_view.dart';
import 'banner_section.dart';
import 'categories_section.dart';
import 'top_bar_section.dart';
import 'services_section.dart';
import 'section_widget.dart';
import 'projects_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  /// REFRESH FUNCTION
  Future<void> _onRefresh(BuildContext context) async {
    context.read<GetBannersByPositionViewModel>().getBannersByPosition("home");
    context.read<GetAllCategoriesViewModel>().getAllCategories();
    context
        .read<GetAllProjectDisplaySectionsViewModel>()
        .getAllProjectDisplaySections();
    context.read<GetNewestProjectsViewModel>().getNewestProjects();

    /// إعادة تحميل مشاريع كل سكشن
    final displayState = context
        .read<GetAllProjectDisplaySectionsViewModel>()
        .state;
    if (displayState is GetAllProjectDisplaySectionsViewModelSuccess) {
      final sections = displayState.projectDisplaySections;
      final projectBloc = context.read<GetProjectsByDisplaySectionViewModel>();
      for (var s in sections) {
        projectBloc.getProjectsByDisplaySection(s.id);
      }
    }

    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
      color: ColorsManager.primaryColor,

      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TOP BAR
                TopBarSection(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (_, animation, __) {
                          return FadeTransition(
                            opacity: animation,
                            child: const SearchForProjectsView(),
                          );
                        },
                      ),
                    );
                  },
                ),

                SizedBox(height: 30.h),

                /// BANNERS
                _buildHomeBanners(),

                SizedBox(height: 30.h),

                /// DISPLAY SECTIONS
                BlocBuilder<
                    GetAllProjectDisplaySectionsViewModel,
                    GetAllProjectDisplaySectionsViewModelStates
                >(
                  builder: (context, state) {
                    if (state is GetAllProjectDisplaySectionsViewModelLoading) {
                      return const DisplaySectionsSkeleton();
                    }

                    if (state is GetAllProjectDisplaySectionsViewModelSuccess) {
                      final sections = state.projectDisplaySections;

                      /// Fetch projects once
                      final projectBloc = context
                          .read<GetProjectsByDisplaySectionViewModel>();
                      for (var sec in sections) {
                        projectBloc.getProjectsByDisplaySection(sec.id);
                      }

                      if (sections.isEmpty) return const SizedBox.shrink();

                      final first = sections.first;
                      final others = sections.skip(1).toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCategories(),
                          SizedBox(height: 30.h),

                          _buildProjectSection(first.id, first.title, context),
                          SizedBox(height: 30.h),

                          const ServicesSection(),
                          SizedBox(height: 30.h),

                          _buildNewestProjects(),
                          SizedBox(height: 30.h),

                          ...others.map(
                                (sec) => Padding(
                              padding: EdgeInsets.only(bottom: 30.h),
                              child: _buildProjectSection(sec.id, sec.title, context),
                            ),
                          ),
                        ],
                      );
                    }

                    return const DisplaySectionsSkeleton();
                  },
                ),
                SizedBox(height: 30.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
  // ============================================================
  // BANNERS
  // ============================================================

  Widget _buildHomeBanners() {
    return BlocBuilder<
      GetBannersByPositionViewModel,
      GetBannersByPositionViewModelStates
    >(
      builder: (context, state) {
        if (state is GetBannersByPositionViewModelStatesLoading) {
          return const BannerSectionSkeleton();
        }
        if (state is GetBannersByPositionViewModelStatesSuccess) {
          return BannerSection(images: state.banners,imageHeight: 200.h  , useFill: true,);
        }
        return const BannerSectionSkeleton();
      },
    );
  }

  // ============================================================
  // CATEGORIES
  // ============================================================

  Widget _buildCategories() {
    return BlocBuilder<
      GetAllCategoriesViewModel,
      GetAllCategoriesViewModelStates
    >(
      builder: (context, state) {
        if (state is GetAllCategoriesViewModelLoading) {
          return const CategoryItemListSkeleton();
        }
        if (state is GetAllCategoriesViewModelSuccess) {
          return CategoriesSection(categoriesList: state.categories);
        }
        return const CategoryItemListSkeleton();
      },
    );
  }

  // ============================================================
  // NEWEST PROJECTS
  // ============================================================

  Widget _buildNewestProjects() {
    return SectionWidget(
      title: "نورونا جديد",
      child:
          BlocBuilder<
            GetNewestProjectsViewModel,
            GetNewestProjectsViewModelStates
          >(
            builder: (context, state) {
              if (state is GetNewestProjectsViewModelLoading) {
                return const ProjectListSkeleton();
              }
              if (state is GetNewestProjectsViewModelSuccess) {
                return ProjectsList(projects: state.projects);
              }
              return const ProjectListSkeleton();
            },
          ),
    );
  }

  // ============================================================
  // PROJECT SECTION
  // ============================================================

  Widget _buildProjectSection(String id, String title, BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<GetProjectsByDisplaySectionViewModel>()
            ..getProjectsByDisplaySection(id),

      child: SectionWidget(
        title: title,
        child:
            BlocBuilder<
              GetProjectsByDisplaySectionViewModel,
              GetProjectsByDisplaySectionViewModelStates
            >(
              builder: (context, state) {
                if (state
                    is GetProjectsByDisplaySectionViewModelStatesLoading) {
                  return const ProjectListSkeleton();
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

                return const ProjectListSkeleton();
              },
            ),
      ),
    );
  }
}
