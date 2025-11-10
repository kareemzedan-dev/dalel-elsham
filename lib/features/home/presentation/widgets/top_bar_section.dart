import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/search_text_field.dart';
import '../../../../core/utils/colors_manager.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.menu, color: ColorsManager.white, size: 30.sp),
          ),
        ),
        SizedBox(width: 12.w),

        Expanded(child: const SearchTextField()),
      ],
    );
  }
}
