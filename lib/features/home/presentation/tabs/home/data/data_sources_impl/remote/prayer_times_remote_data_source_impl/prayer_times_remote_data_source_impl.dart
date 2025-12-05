import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../../../../../../core/helper/network_validation.dart';
import '../../../../domain/entities/prayer_times_entity.dart';
import '../../../data_sources/remote/prayer_times_remote_data_source/prayer_times_remote_data_source.dart';
import '../../../models/prayer_times_model.dart';


 @Injectable(as: PrayerTimesRemoteDataSource)
class PrayerTimesRemoteDataSourceImpl implements PrayerTimesRemoteDataSource {
  final Dio dio;

  PrayerTimesRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Failures, PrayerTimesEntity>> getPrayerTimes(
      double lat,
      double lng,
      ) async {
    try {
      /// 1. Check Internet
      if (!await NetworkValidation.hasInternet()) {
        return Left(NetworkFailure("لا يوجد اتصال بالإنترنت"));
      }

      /// استخدم إحداثيات دمشق دائمًا
      const double damascusLat = 33.5138;
      const double damascusLng = 36.2765;

      /// 2. Build URL
      final String url =
          "https://api.aladhan.com/v1/timings?latitude=$damascusLat&longitude=$damascusLng&method=2";

      /// 3. Make GET request
      final response = await dio.get(url);

      /// 4. Validate Response
      if (response.statusCode == 200 &&
          response.data["code"] == 200 &&
          response.data["data"] != null) {

        final model = PrayerTimesModel.fromJson(response.data);
        return Right(model);
      } else {
        return Left(ServerFailure("حدث خطأ في جلب البيانات"));
      }

    } on DioException catch (e) {
      return Left(ServerFailure("خطأ في الاتصال: ${e.message}"));
    } catch (e) {
      return Left(ServerFailure("خطأ غير متوقع: $e"));
    }
  }

}
