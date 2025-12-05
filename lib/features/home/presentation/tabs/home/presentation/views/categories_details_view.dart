import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/projects/get_projects_by_category_view_model/get_projects_by_category_view_model.dart';
import '../widgets/categories_details_view_body.dart';

class CategoriesDetailsView extends StatelessWidget {
  CategoriesDetailsView({super.key, required this.categoryId,required this.categoryName});

  String? categoryId,categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: categoryName!),
      body: BlocProvider(
        create: (context) =>
            getIt<GetProjectsByCategoryViewModel>()
              ..getProjectsByCategory(categoryId!), // هنا
        child: CategoriesDetailsViewBody(category: categoryId!),
      ),
    );
  }
}
