import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes_manager.dart';
import '../../../../core/utils/colors_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesManager.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorsManager.primaryColor,
      child:  Center(
        child: Image.asset(
         AssetsManager.logo,
          height: 200.h,
          width: 200.w,
        ),
      ),
    );
  }
}
