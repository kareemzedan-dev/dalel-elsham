import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle bold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle bold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle semiBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle regular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  // variations
  static TextStyle semiBold16White = semiBold18.copyWith(fontSize: 16.sp);

  static TextStyle bold24Primary = bold24.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
}
