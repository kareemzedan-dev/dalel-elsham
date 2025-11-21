import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../manager/projects/get_all_projects_view_model/get_all_projects_view_model.dart';
import '../widgets/search_for_projects_view_body.dart';

class SearchForProjectsView extends StatelessWidget {
  const SearchForProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<GetAllProjectsViewModel>(),
        child: SafeArea(child: const SearchForProjectsViewBody()),
      ),
    );
  }
}
