import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item_list.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("تصفح حسب :", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),)
      ,SizedBox(height: 8.h,),
      CategoryItemList(),
    ],);
  }
}
