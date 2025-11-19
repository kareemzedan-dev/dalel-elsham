import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/services/get_user_location_service.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../manager/prayer_times_view_model/prayer_times_view_model.dart';
import '../widgets/prayer_times_view_body.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsManager.mosque,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          color: ColorsManager.grey.withOpacity(0.2),
        ),
        FutureBuilder(
          future: getUserLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "فشل الحصول على موقعك: ${snapshot.error}",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            }

            final position = snapshot.data!;
            final lat = position.latitude;
            final lng = position.longitude;

            return Scaffold(
              backgroundColor: Colors.transparent,
              body: BlocProvider(
                create: (context) =>

                getIt<PrayerTimesViewModel>()..getPrayerTimes(lat, lng),

                child: const PrayerTimesViewBody(),
              ),
            );
          },
        ),
      ],
    );
  }
}

