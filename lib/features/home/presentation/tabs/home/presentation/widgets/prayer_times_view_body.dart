import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class PrayerTimesViewBody extends StatelessWidget {
  const PrayerTimesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> prayers = [
      {"name": "الفجر", "time": "05:12"},
      {"name": "الظهر", "time": "12:03"},
      {"name": "العصر", "time": "03:29"},
      {"name": "المغرب", "time": "05:58"},
      {"name": "العشاء", "time": "07:20"},
    ];

    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new,
                      color: ColorsManager.primaryColor, size: 20.sp),
                ),
                const Spacer(),
                Text(
                  "دمشق, سوريا",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.location_on,
                    color: ColorsManager.primaryColor, size: 20.sp),
              ],
            ),
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const NextPrayerTimer(
                  prayerName: "الفجر",
                  prayerTime: "06:42",
                  timeLeft: "0 ساعة 29 دقيقة 3 ثواني متبقية",
                ),



                // 📅 التاريخ الهجري والميلادي
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "15-05-1447 هـ",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                    Text(
                      "18-11-2025 م",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // 📿 قائمة الصلوات
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      for (final prayer in prayers) ...[
                        PrayerTimeItem(
                          prayerName: prayer["name"]!,
                          prayerTime: prayer["time"]!,
                        ),
                        if (prayer != prayers.last)
                          Divider(
                            color: ColorsManager.primaryColor.withOpacity(0.3),
                            thickness: 1,
                            height: 16.h,
                          ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PrayerTimeItem extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerTimeItem({
    super.key,
    required this.prayerName,
    required this.prayerTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: ColorsManager.primaryColor,
            ),
          ),
          Text(
            prayerTime,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: ColorsManager.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}


class NextPrayerTimer extends StatelessWidget {
  final String prayerName;
  final String prayerTime;
  final String timeLeft;

  const NextPrayerTimer({
    super.key,
    required this.prayerName,
    required this.prayerTime,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h, // رفع الارتفاع شويه عشان النص ياخد مكان فوق القوس
      width: 250.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// 🟨 شارة الصلاة القادمة — فوق القوس مش عليه
          Positioned(
            top: 0.h, // 👈 رفع الشارة فوق القوس
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: ColorsManager.primaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                "الصلاة القادمة: $prayerName",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),

          /// 🟢 القوس
          Positioned(
            top: 40.h, // 👈 حرك القوس لأسفل بحيث الشارة تكون فوقه
            child: CustomPaint(
              size: Size(220.w, 220.w),
              painter: ArcPainter(),
            ),
          ),

          /// 🕓 الوقت في المنتصف
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h), // 👈 تباعد علشان ما يطلعش على الشارة
              Text(
                prayerTime,
                style: TextStyle(
                  fontSize: 44.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.primaryColor,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                timeLeft,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 14.w;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    // القوس (نصف دائرة)
    final startAngle = math.pi; // يبدأ من اليسار
    final sweepAngle = math.pi; // نصف دائرة

    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.greenAccent,
          ColorsManager.primaryColor,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
