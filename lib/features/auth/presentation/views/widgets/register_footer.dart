import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../../config/routes/routes_manager.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "لديك حساب بالفعل؟",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RoutesManager.login),
              child: Text(
                "تسجيل الدخول",
                style: TextStyle(
                  color: ColorsManager.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
