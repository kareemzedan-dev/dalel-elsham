class WeatherEntity {
  final double temperature;
  final double windSpeed;
  final int weatherCode;
  final DateTime time;
  final List<DailyWeatherEntity> daily;

  WeatherEntity({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.time,
    List<DailyWeatherEntity>? daily,
  }) : daily = daily ?? const [];
}


class DailyWeatherEntity {
  final DateTime date;
  final int weatherCode;
  final double maxTemp;
  final double minTemp;

  DailyWeatherEntity({
    required this.date,
    required this.weatherCode,
    required this.maxTemp,
    required this.minTemp,
  });
}
