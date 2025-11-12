import 'package:dalel_elsham/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/tabs/dalel_elsham/presentation/views/dalel_elsham_tab_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/Job_opportunities_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/Job_seekers_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/categories_details_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/prayer_times_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/project_details_view.dart';


class RoutesManager {
  static const String splash = "/";
  static const String home = "home";
  static const String categoriesDetails = "categoriesDetails";
  static const String projectDetails = "projectDetails";
  static const String dalelElsham = "dalelElsham";
  static const String jobOpportunities = "jobOpportunities";
  static const String jobSeekers = "jobSeekers";
  static const String prayerTimes = "prayerTimes";


  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
        case categoriesDetails:
        return MaterialPageRoute(builder: (_) => const CategoriesDetailsView());
        case projectDetails:
        return MaterialPageRoute(builder: (_) => const ProjectDetailsView());
        case dalelElsham:
        return MaterialPageRoute(builder: (_) => const DalelElshamTabView());
        case jobOpportunities:
        return MaterialPageRoute(builder: (_) => const JobOpportunitiesView());
        case jobSeekers:
        return MaterialPageRoute(builder: (_) => const JobSeekersView());
        case prayerTimes:
        return MaterialPageRoute(builder: (_) => const PrayerTimesView());

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
