class PrayerTimesEntity {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  final String readableDate;   // مثل: 19 Nov 2025
  final String hijriDate;      // مثل: 28-05-1447
  final String gregorianDate;  // مثل: 19-11-2025

  PrayerTimesEntity({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.readableDate,
    required this.hijriDate,
    required this.gregorianDate,
  });
}
