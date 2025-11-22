import 'package:dalel_elsham/core/cache/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes_manager.dart';
import '../../../../core/di/di.dart';
import '../tabs/dalel_elsham/presentation/views/dalel_elsham_tab_view.dart';
import '../tabs/home/presentation/manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model.dart';
import '../tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart';
import '../tabs/home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model.dart';
import '../tabs/home/presentation/manager/project_display_section_view_model/get_all_project_display_sections_view_model/get_all_project_display_sections_view_model.dart';
import '../tabs/home/presentation/manager/projects/get_newest_projects_view_model/get_newest_projects_view_model.dart';
import '../tabs/home/presentation/manager/projects/get_projects_by_display_section_view_model/get_projects_by_display_section_view_model.dart';
import '../tabs/home/presentation/widgets/drawer_content.dart';
import '../tabs/home/presentation/widgets/custom_bottom_nav_bar.dart';
import '../tabs/home/presentation/widgets/home_view_body.dart';
import '../tabs/home/presentation/widgets/modal_bottom_sheet_content.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  String? authToken;

  @override
  void initState() {
    super.initState();
    loadAuthToken();
  }

  Future<void> loadAuthToken() async {
    final token = SharedPrefHelper.getString("auth_token");
    setState(() {
      authToken = token;
    });
  }
  late final List<Widget> _pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetBannersByPositionViewModel>()..getBannersByPosition("home"),
        ),
        BlocProvider(
          create: (_) => getIt<GetAllCategoriesViewModel>()..getAllCategories(),
        ),
        BlocProvider(
          create: (_) => getIt<GetAllProjectDisplaySectionsViewModel>()..getAllProjectDisplaySections(),
        ),
        BlocProvider(
          create: (_) => getIt<GetNewestProjectsViewModel>()..getNewestProjects(),
        ),

        /// ★★★ مهم جداً جداً جداً ★★★
        BlocProvider(
          create: (_) => getIt<GetProjectsByDisplaySectionViewModel>(),
        ),
      ],
      child: const HomeViewBody(),
    ),

    const DalelElshamTabView(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BlocProvider(
        create: (_) => getIt<GetAllAppLinksViewModel>()..getAllAppLinks(),
        child: Drawer(child: DrawerContent()),
      ),

      extendBody: true,

      body: IndexedStack(index: currentIndex, children: _pages),

      floatingActionButton: SizedBox(
        height: 70.w,
        width: 70.w,
        child: FloatingActionButton(
          backgroundColor: ColorsManager.primaryColor,
          elevation: 8,
          shape: const CircleBorder(),
          onPressed: () {
            print("TOKEN: $authToken");

            if (authToken != null && authToken!.isNotEmpty) {
              Navigator.pushNamed(context, RoutesManager.addNewService);
              return;
            }

            // لو مش مسجل دخول → افتح bottom sheet
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const ModalBottomSheetContent(),
            );
          },
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white, size: 22.sp),
                SizedBox(height: 2.h),
                Text(
                  'أضف إعلانك',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onItemTapped: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}
