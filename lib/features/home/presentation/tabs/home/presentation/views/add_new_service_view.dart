import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/components/custom_app_bar.dart';
import '../../../../../../../core/di/di.dart';
import '../manager/categories/get_all_categories_view_model/get_all_categories_view_model.dart';
import '../manager/projects/add_project_view_model/add_project_view_model.dart';
import '../widgets/add_new_service_view_body.dart';

class AddNewServiceView extends StatelessWidget {
  const AddNewServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "أضف اعلانك"),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<GetAllCategoriesViewModel>()),
          BlocProvider(create: (context) => getIt<AddNewServiceViewModel>()),
        ],

        child: AddNewServiceViewBody(),
      ),
    );
  }
}
