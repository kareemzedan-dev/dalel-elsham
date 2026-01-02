import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';

abstract class GetWeatherViewModelStates {}

class GetWeatherViewModelInitial extends GetWeatherViewModelStates {}

class GetWeatherViewModelLoading extends GetWeatherViewModelStates {}

class GetWeatherViewModelError extends GetWeatherViewModelStates {
  final String message;
  GetWeatherViewModelError({required this.message});
}

class GetWeatherViewModelSuccess extends GetWeatherViewModelStates {
  final WeatherEntity weatherEntity;
  GetWeatherViewModelSuccess({required this.weatherEntity});
}