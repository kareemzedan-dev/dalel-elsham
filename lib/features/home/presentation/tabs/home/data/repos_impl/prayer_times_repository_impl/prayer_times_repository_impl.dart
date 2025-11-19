import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../domain/entities/prayer_times_entity.dart';
import '../../../domain/repos/prayer_times_repository/prayer_times_repository.dart';
import '../../data_sources/remote/prayer_times_remote_data_source/prayer_times_remote_data_source.dart';
@Injectable(as: PrayerTimesRepository)
class PrayerTimesRepositoryImpl implements PrayerTimesRepository {
  final PrayerTimesRemoteDataSource remoteDataSource;

  PrayerTimesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, PrayerTimesEntity>> getPrayerTimes(
    double lat,
    double lng,
  ) {
    return remoteDataSource.getPrayerTimes(lat, lng);
  }
}

