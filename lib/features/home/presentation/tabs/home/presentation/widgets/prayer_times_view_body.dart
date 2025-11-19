import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../manager/prayer_times_view_model/prayer_times_view_model.dart';
import '../manager/prayer_times_view_model/prayer_times_view_model_states.dart';

class PrayerTimesViewBody extends StatelessWidget {
  const PrayerTimesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesViewModel, PrayerTimesViewModelStates>(
      builder: (context, state) {
        if (state is PrayerTimesViewModelLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PrayerTimesViewModelError) {
          return Center(child: Text(state.message));
        }
        if (state is PrayerTimesViewModelSuccess) {
          final prayers = [
            {"name": "الفجر", "time": state.prayerTimes.fajr},
            {"name": "الظهر", "time": state.prayerTimes.dhuhr},
            {"name": "العصر", "time": state.prayerTimes.asr},
            {"name": "المغرب", "time": state.prayerTimes.maghrib},
            {"name": "العشاء", "time": state.prayerTimes.isha},
          ];
          final nextPrayer = context
              .read<PrayerTimesViewModel>()
              .getNextPrayerName(state.prayerTimes);
          final remaining = context
              .read<PrayerTimesViewModel>()
              .getRemainingTime(state.prayerTimes);

          final hours = remaining.inHours.toString().padLeft(2, '0');
          final minutes = (remaining.inMinutes % 60).toString().padLeft(2, '0');
          final seconds = (remaining.inSeconds % 60).toString().padLeft(2, '0');
          return Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: ColorsManager.primaryColor,
                          size: 20.sp,
                        ),
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
                      Icon(
                        Icons.location_on,
                        color: ColorsManager.primaryColor,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "باقي على صلاة $nextPrayer",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "$hours:$minutes:$seconds",
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
                            "${state.prayerTimes.hijriDate} هـ",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: ColorsManager.primaryColor,
                                ),
                          ),

                          Text(
                            "${state.prayerTimes.gregorianDate} م",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
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
                                  color: ColorsManager.primaryColor.withOpacity(
                                    0.3,
                                  ),
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
        return Center(child: Text("حدث خطا ما "));
      },
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
              color: ColorsManager.white,
            ),
          ),
          Text(
            prayerTime,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
