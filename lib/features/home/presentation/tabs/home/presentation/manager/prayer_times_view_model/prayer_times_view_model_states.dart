import '../../../domain/entities/prayer_times_entity.dart';

abstract class PrayerTimesViewModelStates {}
class PrayerTimesViewModelInitial extends PrayerTimesViewModelStates {}
class PrayerTimesViewModelLoading extends PrayerTimesViewModelStates {}
class PrayerTimesViewModelError extends PrayerTimesViewModelStates {
  final String message;
  PrayerTimesViewModelError(this.message);
}
class PrayerTimesViewModelSuccess extends PrayerTimesViewModelStates {
  final PrayerTimesEntity prayerTimes;
  final Duration remaining;
  final String nextPrayer;

  PrayerTimesViewModelSuccess(this.prayerTimes, this.remaining, this.nextPrayer);
}