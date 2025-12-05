import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/project_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/projects/get_all_projects_view_model/get_all_projects_view_model.dart';
import '../manager/projects/get_all_projects_view_model/get_all_projects_view_model_states.dart';

class SearchForProjectsViewBody extends StatefulWidget {
  const SearchForProjectsViewBody({super.key});

  @override
  State<SearchForProjectsViewBody> createState() =>
      _SearchForProjectsViewBodyState();
}

class _SearchForProjectsViewBodyState extends State<SearchForProjectsViewBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// 🔥 بمجرد فتح الصفحة يقوم بجلب كل المشاريع
    context.read<GetAllProjectsViewModel>().getAllProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),

        /// ========================== SEARCH FIELD ==========================
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 22.sp),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    context.read<GetAllProjectsViewModel>().searchProjects(
                      value,
                    );
                  },
                  decoration: InputDecoration(
                    hintText: "ابحث عن مشروع...",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        /// ========================== RESULTS LIST ==========================
        Expanded(
          child:
              BlocBuilder<
                GetAllProjectsViewModel,
                GetAllProjectsViewModelStates
              >(
                builder: (context, state) {
                  if (state is GetAllProjectsViewModelLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is GetAllProjectsViewModelError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is GetAllProjectsViewModelSuccess) {
                    final projects = state.projects;

                    if (projects.isEmpty) {
                      return Center(
                        child: Text(
                          "لا توجد نتائج للبحث",
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: projects.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final project = projects[index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ProjectItem(
                            projectEntity: project,
                            width: double.infinity,
                          ),
                        ); // UI Card
                      },
                    );
                  }

                  return SizedBox();
                },
              ),
        ),
      ],
    );
  }
}
