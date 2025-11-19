import 'package:dalel_elsham/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import 'config/routes/routes_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/cache/shared_preferences.dart';
import 'core/di/di.dart';
import 'firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await Supabase.initialize(
    url: 'https://rfxticljudaqokliiugx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmeHRpY2xqdWRhcW9rbGlpdWd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyMzEyNjksImV4cCI6MjA3ODgwNzI2OX0.jUBgrAsz19r7YrEvkwxv4yD3fKBo-1yUwUUDw32SgNU',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  await configureDependencies();
  await SharedPrefHelper.init();
  await addDummyAppLinks();
  runApp(const DalelElsham());
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
            initialRoute: RoutesManager.home,
          ),
        );
      },
    );
  }
}


Future<void> addDummyAppLinks() async {
  final added = SharedPrefHelper.getBool("dummy_links_added") ?? false;

  if (added) return; // علشان ميعملش إضافة كل مرة

  final firestore = FirebaseFirestore.instance;
  const uuid = Uuid();

  final List<Map<String, dynamic>> dummyLinks = [
    {
      "id": uuid.v4(),
      "type": "contact_us",
      "title": "اتصل بنا",
      "url": "https://wa.me/963987654321",
      "updatedAt": DateTime.now().toIso8601String(),
    },
    {
      "id": uuid.v4(),
      "type": "share_app",
      "title": "مشاركة التطبيق",
      "url": "https://your-app-link.com",
      "updatedAt": DateTime.now().toIso8601String(),
    },
    {
      "id": uuid.v4(),
      "type": "rate_us",
      "title": "قيّم التطبيق",
      "url": "https://play.google.com/store/apps/details?id=your.app.id",
      "updatedAt": DateTime.now().toIso8601String(),
    },
    {
      "id": uuid.v4(),
      "type": "terms",
      "title": "سياسة الخصوصية",
      "url": "https://yourwebsite.com/privacy",
      "updatedAt": DateTime.now().toIso8601String(),
    },
  ];

  for (var item in dummyLinks) {
    await firestore
        .collection("app_links")
        .doc(item["id"])
        .set(item);
  }

  SharedPrefHelper.setBool("dummy_links_added", true);
}