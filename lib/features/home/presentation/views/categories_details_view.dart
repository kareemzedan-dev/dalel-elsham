import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../widgets/categories_details_view_body.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(title: "تفاصيل الفئة",),
      body: const CategoriesDetailsViewBody(),
    );
  }
}
