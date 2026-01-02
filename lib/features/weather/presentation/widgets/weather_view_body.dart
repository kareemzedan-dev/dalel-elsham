import 'package:dalel_elsham/core/enums/weather_types.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:dalel_elsham/features/weather/presentation/manager/get_weather_view_model/get_weather_view_model.dart';
import 'package:dalel_elsham/features/weather/presentation/manager/get_weather_view_model/get_weather_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherViewModel, GetWeatherViewModelStates>(
      builder: (context, state) {
    if (state is GetWeatherViewModelInitial ||
    state is GetWeatherViewModelLoading) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ColorsManager.primaryColor,
          ColorsManager.primaryColor.withValues(alpha: .5),
        ],
      ),
    ),
    child: const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    ),
  );
}

        if (state is GetWeatherViewModelError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is GetWeatherViewModelSuccess) {
          final weather = state.weatherEntity;

          return Container(
            width: double.infinity,
            decoration:   BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorsManager.primaryColor, ColorsManager.primaryColor.withValues(alpha: .5)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// ===== Card الطقس اليوم =====
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Lottie.asset(
                        getWeatherLottie(weather.weatherCode),
                        height: 160,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '${weather.temperature.round()}°',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 56.sp,
                            ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        weatherTypeToText(weather.weatherCode),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '💨 ${weather.windSpeed} km/h',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white70,
                              fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                /// ===== الأيام الجاية =====
                if (weather.daily.isEmpty) ...[
                    Text(
                    'لا توجد توقعات للأيام القادمة',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                          fontSize: 16.sp,
                        ),
                  ),
                ] else ...[
                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: weather.daily.length,
                      itemBuilder: (context, index) {
                        final day = weather.daily[index];
                        return _ForecastDayItem(
                          day: _dayName(day.date),
                          temp:
                              '${day.maxTemp.round()}° / ${day.minTemp.round()}°',
                          weatherCode: day.weatherCode,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                    ),
                  ),
                ],
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}

class _ForecastDayItem extends StatelessWidget {
  final String day;
  final String temp;
  final int weatherCode;

  const _ForecastDayItem({
    required this.day,
    required this.temp,
    required this.weatherCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day, style:  Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white70,
                fontSize: 16.sp,
              )),
          const SizedBox(height: 8),
          Icon(weatherIcon(weatherCode), color: Colors.white),
          const SizedBox(height: 8),
          Text(
            temp,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}

String weatherTypeToText(int code) {
  if (code == 0) return 'مشمس';
  if (code <= 2) return 'غائم جزئياً';
  if (code == 3) return 'غائم';
  if (code >= 61) return 'ممطر';
  return 'طقس معتدل';
}

IconData weatherIcon(int code) {
  if (code == 0) return Icons.wb_sunny;
  if (code <= 2) return Icons.cloud_queue;
  if (code == 3) return Icons.cloud;
  if (code >= 61) return Icons.grain;
  return Icons.help;
}

String _dayName(DateTime date) {
  const days = [
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
  ];
  return days[date.weekday % 7];
}
