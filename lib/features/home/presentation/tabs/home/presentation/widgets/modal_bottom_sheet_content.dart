import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/components/custom_button.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';


class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: ColorsManager.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Center(
                child: Image.asset(
                  AssetsManager.profile,
                  color: ColorsManager.primaryColor,
                  height: 120.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'خلّي الناس تعرف مشروعك',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              'أضف إعلانك الآن معنا، وخلي أهل الشام\n يوصلوا لعندك بسهولة.',
              textAlign: TextAlign.center,

              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomButton(
                text: 'تسجيل الدخول / إنشاء حساب',
                onPressed: () {},
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "الغاء",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
