import '../../domain/entities/prayer_times_entity.dart';

class PrayerTimesModel extends PrayerTimesEntity {
  PrayerTimesModel({
    required super.fajr,
    required super.sunrise,
    required super.dhuhr,
    required super.asr,
    required super.maghrib,
    required super.isha,
    required super.readableDate,
    required super.hijriDate,
    required super.gregorianDate,
  });

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    final timings = json['data']['timings'];
    final date = json['data']['date'];

    return PrayerTimesModel(
      fajr: timings['Fajr'] ?? "",
      sunrise: timings['Sunrise'] ?? "",
      dhuhr: timings['Dhuhr'] ?? "",
      asr: timings['Asr'] ?? "",
      maghrib: timings['Maghrib'] ?? "",
      isha: timings['Isha'] ?? "",

      readableDate: date['readable'] ?? "",
      hijriDate: date['hijri']?['date'] ?? "",
      gregorianDate: date['gregorian']?['date'] ?? "",
    );
  }
}
