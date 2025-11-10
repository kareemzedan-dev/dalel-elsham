import 'package:dalel_elsham/features/home/presentation/widgets/top_bar_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'banner_section.dart';
import 'categories_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          TopBarSection(),
          SizedBox(height: 30.h,),
          BannerSection(),
          SizedBox(height: 30.h,),
          CategoriesSection(),
        ]),
      ),
    ));
  }
}
