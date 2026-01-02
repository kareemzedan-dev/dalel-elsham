import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/weather/data/data_sources/remote/get_weather_remote_data_source/get_weather_remote_data_source.dart';
import 'package:dalel_elsham/features/weather/data/models/weather_model.dart';
import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetWeatherRemoteDataSource)
class GetWeatherRemoteDataSourceImpl
    implements GetWeatherRemoteDataSource {

  final Dio dio;

  GetWeatherRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Failures, WeatherEntity>> getWeatherByLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
     final response = await dio.get(
  'https://api.open-meteo.com/v1/forecast',
  queryParameters: {
    'latitude': latitude,
    'longitude': longitude,
    'current': 'temperature_2m,wind_speed_10m,weather_code',
    'daily': 'weather_code,temperature_2m_max,temperature_2m_min',
    'timezone': 'auto',
  },
);

      final currentJson = response.data['current'];

final weatherModel = WeatherModel.fromJson(response.data);


      return Right(weatherModel);  
    } on DioException catch (_) {
      return Left(ServerFailure( 'خطاء في جلب البيانات'));
    } catch (_) {
      return Left(ServerFailure('خطاء في جلب البيانات'));
    }
  }
}
