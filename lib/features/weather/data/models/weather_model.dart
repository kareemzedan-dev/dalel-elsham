import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.temperature,
    required super.windSpeed,
    required super.weatherCode,
    required super.time,
    required super.daily,
  });
factory WeatherModel.fromJson(Map<String, dynamic> json) {
  final dailyJson = json['daily'];

  List<DailyWeatherEntity> dailyList = [];

  if (dailyJson != null) {
    dailyList = List.generate(
      dailyJson['time'].length,
      (index) => DailyWeatherEntity(
        date: DateTime.parse(dailyJson['time'][index]),
        weatherCode: dailyJson['weather_code'][index],
        maxTemp: (dailyJson['temperature_2m_max'][index] as num).toDouble(),
        minTemp: (dailyJson['temperature_2m_min'][index] as num).toDouble(),
      ),
    );
  }

  return WeatherModel(
    temperature: (json['current']['temperature_2m'] as num).toDouble(),
    windSpeed: (json['current']['wind_speed_10m'] as num).toDouble(),
    weatherCode: json['current']['weather_code'],
    time: DateTime.parse(json['current']['time']),
    daily: dailyList, // 👈 دايمًا List
  );
}

}
