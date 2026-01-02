import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/weather/data/data_sources/remote/get_weather_remote_data_source/get_weather_remote_data_source.dart';
import 'package:dalel_elsham/features/weather/data/data_sources_impl/remote/get_weather_remote_data_source_impl/get_weather_remote_data_source_impl.dart';
import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';
import 'package:dalel_elsham/features/weather/domain/repos/get_weather_repo/get_weather_repo.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetWeatherRepo)
class GetWeatherRepoImpl implements GetWeatherRepo {
  final GetWeatherRemoteDataSource remoteDataSource;

  GetWeatherRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, WeatherEntity>> getWeatherByLocation({
    required double latitude,
    required double longitude,
  }) async {
    return remoteDataSource.getWeatherByLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
