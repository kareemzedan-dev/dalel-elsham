import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors_manager.dart';
import 'add_image_box.dart';

class ImagesGroupBox extends StatelessWidget {
  const ImagesGroupBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Column(
        children: [
          _topCounter(context),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AddImageBox(),
                AddImageBox(),
                AddImageBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topCounter(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "0/3",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: ColorsManager.black.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
