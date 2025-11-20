import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes_manager.dart';
import '../../../../core/cache/shared_preferences.dart';
import '../../../../core/utils/colors_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  final token = SharedPrefHelper.getString("auth_token");

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (token != null) {
        Navigator.pushReplacementNamed(context, RoutesManager.home);
      } else {
        Navigator.pushReplacementNamed(context, RoutesManager.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorsManager.primaryColor,
      child: Center(
        child: Image.asset(AssetsManager.logo, height: 200.h, width: 200.w),
      ),
    );
  }
}
