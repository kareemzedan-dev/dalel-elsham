import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/drawer_content.dart';
import '../widgets/home_view_body.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.white, child: DrawerContent()),
      extendBody: true,
      backgroundColor: Colors.white,
      body: const HomeViewBody(),
      floatingActionButton: SizedBox(
        height: 70.h,
        width: 70.w,
        child: FloatingActionButton(
          backgroundColor: ColorsManager.primaryColor,
          elevation: 8,
          shape: const CircleBorder(),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.black, size: 24.sp),
              SizedBox(height: 2.h),
              Text(
                'أضف إعلانك',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
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
