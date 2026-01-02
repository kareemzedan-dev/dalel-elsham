import 'package:dalel_elsham/config/theme/app_theme.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/get_usd_to_syp_view_model/get_usd_to_syp_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import 'config/routes/routes_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/cache/shared_preferences.dart';
import 'core/di/di.dart';
import 'core/services/notification_service.dart';
import 'features/home/presentation/tabs/home/presentation/manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model.dart';
import 'features/home/presentation/tabs/home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model.dart';
import 'features/home/presentation/tabs/home/presentation/manager/project_display_section_view_model/get_all_project_display_sections_view_model/get_all_project_display_sections_view_model.dart';
import 'features/home/presentation/tabs/home/presentation/manager/projects/get_newest_projects_view_model/get_newest_projects_view_model.dart';
import 'features/home/presentation/tabs/home/presentation/manager/projects/get_projects_by_display_section_view_model/get_projects_by_display_section_view_model.dart';
import 'firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Supabase.initialize(
    url: 'https://rfxticljudaqokliiugx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmeHRpY2xqdWRhcW9rbGlpdWd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyMzEyNjksImV4cCI6MjA3ODgwNzI2OX0.jUBgrAsz19r7YrEvkwxv4yD3fKBo-1yUwUUDw32SgNU',
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();
  await SharedPrefHelper.init();
  await NotificationService.loadAdminTokens();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await FirebaseMessaging.instance.subscribeToTopic("all");
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint("🔔 Notification received: ${message.notification?.title}");
  });

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  final appLinksVM = getIt<GetAllAppLinksViewModel>();
  appLinksVM.getAllAppLinks();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GetAllAppLinksViewModel>(create: (_) => appLinksVM),
        BlocProvider(
          create: (_) => getIt<GetAllCategoriesViewModel>()..getAllCategories(),
        ),
        BlocProvider(
          create: (_) =>
              getIt<GetAllProjectDisplaySectionsViewModel>()
                ..getAllProjectDisplaySections(),
        ),
        BlocProvider(
          create: (_) =>
              getIt<GetNewestProjectsViewModel>()..getNewestProjects(),
        ),
        BlocProvider(
          create: (_) => getIt<GetAllAppLinksViewModel>()..getAllAppLinks(),
        ),

        BlocProvider(
          create: (_) => getIt<GetProjectsByDisplaySectionViewModel>(),
        ),
             BlocProvider(
        create: (context) => getIt<GetUsdToSypViewModel>()..getUsdToSyp(),
        ),
        
      ],
      child: const DalelElsham(),
    ),
  );
}

class DalelElsham extends StatelessWidget {
  const DalelElsham({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,

            locale: const Locale('ar'),
            supportedLocales: const [Locale('ar'), Locale('en')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            onGenerateRoute: RoutesManager.onGenerateRoute,
            initialRoute: RoutesManager.splash,
          ),
        );
      },
    );
  }
}
