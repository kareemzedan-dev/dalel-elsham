import 'package:dalel_elsham/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/home/presentation/tabs/dalel_elsham/presentation/views/dalel_elsham_tab_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/Job_opportunities_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/Job_seekers_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/add_new_service_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/categories_details_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/job_offer_form_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/job_request_form_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/prayer_times_view.dart';
import '../../features/home/presentation/tabs/home/presentation/views/project_details_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';


class RoutesManager {
  static const String splash = "/";
  static const String home = "home";
  static const String categoriesDetails = "categoriesDetails";
  static const String projectDetails = "projectDetails";
  static const String dalelElsham = "dalelElsham";
  static const String jobOpportunities = "jobOpportunities";
  static const String jobSeekers = "jobSeekers";
  static const String prayerTimes = "prayerTimes";
  static const String login = "login";
  static const String register = "register";
  static const String onboarding = "onboarding";
  static const String addNewService = "addNewService";
  static const String jobOfferForm = "jobOfferForm";
  static const String jobRequestForm = "jobRequestForm";


  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
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
        case login:
        return MaterialPageRoute(builder: (_) => const LoginView());
        case register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
        case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
        case addNewService:
        return MaterialPageRoute(builder: (_) => const AddNewServiceView());
        case jobOfferForm:
        return MaterialPageRoute(builder: (_) => const JobOfferFormView());
        case jobRequestForm:
        return MaterialPageRoute(builder: (_) => const JobRequestFormView());

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
