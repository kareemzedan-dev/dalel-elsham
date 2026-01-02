import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract class GetWeatherRepo {
  Future<Either<Failures, WeatherEntity>> getWeatherByLocation(
     {
      required double latitude,
      required double longitude
     }
  );
}
