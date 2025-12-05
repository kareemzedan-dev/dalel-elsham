import 'dart:async';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/use_cases/prayer_times_usecase/prayer_times_usecase.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/prayer_times_view_model/prayer_times_view_model_states.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../domain/entities/prayer_times_entity.dart';

@injectable
class PrayerTimesViewModel extends Cubit<PrayerTimesViewModelStates> {
  final PrayerTimesUseCase prayerTimesUseCase;

  Timer? timer;
  PrayerTimesEntity? lastData;
  Duration remaining = Duration.zero;
  String nextPrayer = "";

  PrayerTimesViewModel(this.prayerTimesUseCase)
      : super(PrayerTimesViewModelInitial());

  Future<Either<Failures, PrayerTimesEntity>> getPrayerTimes(
      double lat, double lng) async {
    try {
      emit(PrayerTimesViewModelLoading());

      final result = await prayerTimesUseCase(lat, lng);

      return result.fold(
        ifLeft: (fail) {
          emit(PrayerTimesViewModelError(fail.message));
          return Left(fail);
        },
        ifRight: (value) {
          lastData = value;

          // نحسب الصلاة القادمة والوقت المتبقي
          nextPrayer = getNextPrayerName(value);
          remaining = getRemainingTime(value);

          // نشغل المؤقت لعمل countdown
          _startTimer();

          emit(PrayerTimesViewModelSuccess(
            value,
            remaining,
            nextPrayer,
          ));

          return Right(value);
        },
      );
    } catch (e) {
      emit(PrayerTimesViewModelError(e.toString()));
      return Left(ServerFailure(e.toString()));
    }
  }

  // -------------------------
  // حساب الصلاة القادمة
  // -------------------------
  String getNextPrayerName(PrayerTimesEntity t) {
    final now = DateTime.now();

    DateTime toTime(String time) {
      final parts = time.split(":");
      return DateTime(now.year, now.month, now.day,
          int.parse(parts[0]), int.parse(parts[1]));
    }

    final fajr = toTime(t.fajr);
    final dhuhr = toTime(t.dhuhr);
    final asr = toTime(t.asr);
    final maghrib = toTime(t.maghrib);
    final isha = toTime(t.isha);

    if (now.isBefore(fajr)) return "الفجر";
    if (now.isBefore(dhuhr)) return "الظهر";
    if (now.isBefore(asr)) return "العصر";
    if (now.isBefore(maghrib)) return "المغرب";
    if (now.isBefore(isha)) return "العشاء";

    return "الفجر";
  }

  // -------------------------
  // حساب الوقت المتبقي
  // -------------------------
  Duration getRemainingTime(PrayerTimesEntity t) {
    final now = DateTime.now();

    DateTime toTime(String time) {
      final parts = time.split(":");
      return DateTime(now.year, now.month, now.day,
          int.parse(parts[0]), int.parse(parts[1]));
    }

    final next = getNextPrayerName(t);

    final times = {
      "الفجر": toTime(t.fajr),
      "الظهر": toTime(t.dhuhr),
      "العصر": toTime(t.asr),
      "المغرب": toTime(t.maghrib),
      "العشاء": toTime(t.isha),
    };

    DateTime target = times[next]!;

    if (target.isBefore(now)) {
      target = target.add(const Duration(days: 1));
    }

    return target.difference(now);
  }

  // -------------------------
  // مؤقت للتحديث كل ثانية
  // -------------------------
  void _startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (lastData == null) return;

      remaining -= const Duration(seconds: 1);

      if (remaining.inSeconds <= 0) {
        nextPrayer = getNextPrayerName(lastData!);
        remaining = getRemainingTime(lastData!);
      }

      emit(PrayerTimesViewModelSuccess(
        lastData!,
        remaining,
        nextPrayer,
      ));
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
