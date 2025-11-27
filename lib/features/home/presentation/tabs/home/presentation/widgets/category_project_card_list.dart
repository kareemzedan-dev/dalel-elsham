import 'package:dalel_elsham/config/routes/routes_manager.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/projects/get_projects_by_category_view_model/get_projects_by_category_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/projects/get_projects_by_category_view_model/get_projects_by_category_view_model_states.dart';
import '../manager/projects/update_project_views_view_model/update_project_views_view_model.dart';
import 'category_project_card.dart';
import 'package:lottie/lottie.dart';

class CategoryProjectCardList extends StatelessWidget {
  const CategoryProjectCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetProjectsByCategoryViewModel,
      GetProjectsByCategoryViewModelStates
    >(
      builder: (context, state) {
        if (state is GetProjectsByCategoryViewModelLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetProjectsByCategoryViewModelError) {
          return const Center(child: Text("حدث خطأ ما أثناء جلب المشاريع"));
        }

        if (state is GetProjectsByCategoryViewModelSuccess) {
          if (state.projects.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/lottie/empty.json",
                      height: 200.h,
                      width: 200.w,
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      "لا توجد مشاريع ضمن هذه الفئة حتى الآن",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "سيتم تعبئة هذا القسم خلال يومين كحد أقصى",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }


          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.projects.length,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              return CategoryProjectCard(
                onTap: () {
                  final projectId = state.projects[index].id;
                  context.read<UpdateProjectViewsViewModel>().updateProjectViews(projectId);
                  Navigator.pushNamed(
                    context,
                    RoutesManager.projectDetails,
                    arguments: {"projectId": state.projects[index].id},
                  );
                },
                project: state.projects[index],
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
