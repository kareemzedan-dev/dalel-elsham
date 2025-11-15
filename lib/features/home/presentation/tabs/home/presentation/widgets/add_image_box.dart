import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';


class AddImageBox extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const AddImageBox({
    super.key,
    this.text = "اضافه صوره",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey, width: 1.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _circleIcon(),
            SizedBox(height: 5.h),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: ColorsManager.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AssetsManager.addNewServiceImage,
          height: 24.h,
          width: 24.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
