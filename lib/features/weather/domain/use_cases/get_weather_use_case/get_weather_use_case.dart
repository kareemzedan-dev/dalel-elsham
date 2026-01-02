import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';
import 'package:dalel_elsham/features/weather/domain/repos/get_weather_repo/get_weather_repo.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetWeatherUseCase {
  final GetWeatherRepo weatherRepository;

  GetWeatherUseCase(this.weatherRepository);

  Future<Either<Failures, WeatherEntity>> call({
      required double latitude,
      required double longitude
     } ) async {
    return await weatherRepository.getWeatherByLocation(
      latitude: latitude,
      longitude: longitude
    );
  }
}