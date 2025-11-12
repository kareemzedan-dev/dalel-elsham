import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/assets_manager.dart';
import '../widgets/prayer_times_view_body.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          AssetsManager.mosque,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          color: ColorsManager.black.withOpacity(0.6),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: const PrayerTimesViewBody(),
        ),
      ],
    );
  }
}
