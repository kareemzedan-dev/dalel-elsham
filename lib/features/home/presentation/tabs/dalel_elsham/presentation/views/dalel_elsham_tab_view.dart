import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../widgets/dalel_elsham_tab_view_body.dart';
import '../manager/get_section_status_view_model/get_section_status_view_model.dart';
import '../manager/get_section_status_view_model/get_section_status_view_model_states.dart';

class DalelElshamTabView extends StatelessWidget {
  const DalelElshamTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      getIt<GetSectionStatusViewModel>()..getSectionStatus("dalel_section"),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "دليل الشام",
          showBackButton: false,
        ),
        body: BlocBuilder<GetSectionStatusViewModel, GetSectionStatusViewModelStates>(
          builder: (context, state) {
            if (state is GetSectionStatusViewModelLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is GetSectionStatusViewModelError) {
              return Center(
                child: Text(
                  "حدث خطأ: ${state.message}",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            if (state is GetSectionStatusViewModelSuccess) {
              // ⭐ القسم مفعل
              if (state.isActive) {
                return DalelElshamTabViewBody();
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Lottie.asset(
                        "assets/lottie/coming_soon.json",

                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "قريبًا",
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "نصنع لكم ما يجعل حياتكم أسهل",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );

            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
