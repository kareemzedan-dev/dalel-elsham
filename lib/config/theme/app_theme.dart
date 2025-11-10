import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/colors_manager.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      brightness: Brightness.light,
      primary: ColorsManager.primaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: ColorsManager.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: ColorsManager.black.withValues(alpha: 0.8),
        fontSize: 14.sp,
      ),
      titleLarge: TextStyle(
        color: ColorsManager.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      brightness: Brightness.dark,
      primary: ColorsManager.primaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: ColorsManager.white.withValues(alpha: 0.8),
        fontSize: 14.sp,
      ),
      titleLarge: TextStyle(
        color: ColorsManager.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
