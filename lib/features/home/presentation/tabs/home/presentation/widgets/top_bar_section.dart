import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/components/search_text_field.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../manager/projects/get_all_projects_view_model/get_all_projects_view_model.dart';
import '../views/search_for_projects_view.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          // -------------------- MENU BUTTON --------------------
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.all(6.w),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 26.sp,
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // -------------------- SEARCH FIELD --------------------
          Expanded(
            child: SearchTextField(
              onTap: onTap,  // 👈 لما يدوس على السيرش
            ),
          ),
        ],
      ),
    );
  }
}
