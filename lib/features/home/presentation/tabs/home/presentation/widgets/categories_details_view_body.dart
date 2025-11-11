import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_filter_bar.dart';
import 'category_project_card_list.dart';

class  CategoriesDetailsViewBody extends StatelessWidget {
  const  CategoriesDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryFilterBar(
              categoriesList: ['الكل', 'كافتيريات', 'مطاعم', 'مرطبات'],
            ),
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CategoryProjectCardList(),
          ),


        ],
      ),
    );
  }
}
