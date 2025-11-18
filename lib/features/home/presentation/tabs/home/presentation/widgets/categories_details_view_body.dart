import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/di/di.dart';
import '../manager/projects/get_projects_by_category_view_model/get_projects_by_category_view_model.dart';
import 'category_filter_bar.dart';
import 'category_project_card_list.dart';

class CategoriesDetailsViewBody extends StatefulWidget {
  const CategoriesDetailsViewBody({super.key, required this.category});

  final String category;

  @override
  State<CategoriesDetailsViewBody> createState() =>
      _CategoriesDetailsViewBodyState();
}

class _CategoriesDetailsViewBodyState extends State<CategoriesDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [


          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const CategoryProjectCardList(),
          ),
        ],
      ),
    );
  }
}
