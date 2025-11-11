import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/search_text_field.dart';
import '../../../../core/utils/colors_manager.dart';

class TopBarSection extends StatelessWidget {
  const TopBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.all(6.w),
                child: Icon(
                  Icons.menu,
                  color: ColorsManager.white,
                  size: 26.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          const Expanded(child: SearchTextField()),
        ],
      ),
    );
  }
}
