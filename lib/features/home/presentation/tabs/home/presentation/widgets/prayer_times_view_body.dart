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
        SizedBox(height: 70.h),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "باقي على صلاة الفجر",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "06:42:07",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                SizedBox(height: 16.h),
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
