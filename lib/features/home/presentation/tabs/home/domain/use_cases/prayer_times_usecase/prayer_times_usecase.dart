import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../entities/prayer_times_entity.dart';
import '../../repos/prayer_times_repository/prayer_times_repository.dart';
@injectable
class PrayerTimesUseCase {
  final PrayerTimesRepository prayerTimesRepository;

  PrayerTimesUseCase({required this.prayerTimesRepository});

  Future<Either<Failures, PrayerTimesEntity>> call(double lat, double lng) {
    return prayerTimesRepository.getPrayerTimes(lat, lng);
  }
}