import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/prayer_times_view_body.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const PrayerTimesViewBody(),
    );
  }
}
