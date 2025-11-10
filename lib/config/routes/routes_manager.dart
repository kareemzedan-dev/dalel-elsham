import 'package:dalel_elsham/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';


class RoutesManager {
  static const String splash = "/";
  static const String home = "home";


  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
