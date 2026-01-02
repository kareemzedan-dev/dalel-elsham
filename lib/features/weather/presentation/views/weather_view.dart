import 'package:dalel_elsham/core/components/custom_app_bar.dart';
import 'package:dalel_elsham/core/di/di.dart';
import 'package:dalel_elsham/core/services/location_service.dart';
import 'package:dalel_elsham/features/weather/presentation/manager/get_weather_view_model/get_weather_view_model.dart';
import 'package:dalel_elsham/features/weather/presentation/widgets/weather_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetWeatherViewModel>(
      create: (_) => getIt<GetWeatherViewModel>()
        ..getWeatherFromCurrentLocation(),
      child: Scaffold(
        appBar: const CustomAppBar(title: "الطقس"),
        body: const WeatherViewBody(),
      ),
    );
  }
}
