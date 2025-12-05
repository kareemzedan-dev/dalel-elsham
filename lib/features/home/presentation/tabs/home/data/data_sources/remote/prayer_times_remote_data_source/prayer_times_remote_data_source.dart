import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/prayer_times_entity.dart';



abstract class PrayerTimesRemoteDataSource {
  Future<Either<Failures, PrayerTimesEntity>> getPrayerTimes(
    double lat,
    double lng,
  );
}
