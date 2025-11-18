import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/projects/get_project_details_view_model/get_project_details_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/projects/get_project_details_view_model/get_project_details_view_model_states.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_details_contacts.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_details_description.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_details_footer.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_details_gallery.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_details_header.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_details_worktime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../domain/entities/banner_entity.dart';
import 'banner_section.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetProjectDetailsViewModel,
      GetProjectDetailsViewModelStates
    >(
      builder: (context, state) {
        if (state is GetProjectDetailsViewModelLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetProjectDetailsViewModelError) {
          return Center(child: Text(state.message));
        }
        if (state is GetProjectDetailsViewModelSuccess) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        BannerSection(
                          images: state.project.images.map((img) {
                            return BannerEntity(
                              id: UniqueKey().toString(),
                              imageUrl: img,
                              type: "internal",
                              link: null,
                              projectId: state.project.id,
                              places: ["projects"],
                              isActive: true,
                              order: 0,
                              createdAt: DateTime.now(),
                            );
                          }).toList(),
                        ),

                        SizedBox(height: 16.h),
                        ProjectDetailsHeader(
                          title: state.project.title,
                          location: state.project.location,
                        ),
                        SizedBox(height: 8.h),
                        const ProjectDetailsContacts(),
                        SizedBox(height: 8.h),
                        ProjectDetailsDescription(
                          description: state.project.description,
                        ),
                        SizedBox(height: 16.h),
                        const ProjectDetailsWorkTime(),
                        SizedBox(height: 8.h),
                        Divider(thickness: 1.w, color: Colors.grey),
                        SizedBox(height: 16.h),
                        const ProjectDetailsGallery(),
                      ],
                    ),
                  ),
                ),
              ),

              const ProjectDetailsFooter(),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
