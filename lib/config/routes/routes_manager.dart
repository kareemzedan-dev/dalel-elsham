import 'package:dalel_elsham/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/views/categories_details_view.dart';


class RoutesManager {
  static const String splash = "/";
  static const String home = "home";
  static const String categoriesDetails = "categoriesDetails";


  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
        case categoriesDetails:
        return MaterialPageRoute(builder: (_) => const CategoriesDetailsView());

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
