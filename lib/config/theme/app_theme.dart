import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/colors_manager.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Tajawal',
    scaffoldBackgroundColor: ColorsManager.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.white,
      brightness: Brightness.light,
      primary: ColorsManager.white,
    ),


    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryColor,
      foregroundColor: ColorsManager.black,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
        fontFamily: 'Tajawal',
      ),
      iconTheme: IconThemeData(color: ColorsManager.black, size: 22.sp),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.white,
      selectedItemColor: ColorsManager.primaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      showUnselectedLabels: true,
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
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
      bodySmall: TextStyle(
        color: ColorsManager.black.withValues(alpha: 0.6),
        fontSize: 12.sp,
      ),
      titleLarge: TextStyle(
        color: ColorsManager.black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.primaryColor, width: 1.5),
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 14.sp,
      ),
    ),

    iconTheme: IconThemeData(color: ColorsManager.black, size: 22.sp),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: Colors.black,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      ),
    ),
  );

  // 🌙 الثيم الداكن
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Tajawal',
    scaffoldBackgroundColor: ColorsManager.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      brightness: Brightness.dark,
      primary: ColorsManager.primaryColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'Tajawal',
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 22.sp),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFF1E1E1E),
      selectedItemColor: ColorsManager.primaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFF2C2C2C),
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: ColorsManager.white.withValues(alpha: 0.9),
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        color: ColorsManager.white.withValues(alpha: 0.7),
        fontSize: 12.sp,
      ),
      titleLarge: TextStyle(
        color: ColorsManager.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2C2C2C),
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorsManager.primaryColor, width: 1.5),
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 14.sp,
      ),
    ),

    iconTheme: IconThemeData(color: ColorsManager.white, size: 22.sp),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: Colors.black,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      ),
    ),
  );
}
