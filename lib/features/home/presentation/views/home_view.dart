import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tabs/home/presentation/widgets/drawer_content.dart';
import '../tabs/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';
import '../tabs/home/presentation/widgets/home_view_body.dart';
import '../tabs/home/presentation/widgets/modal_bottom_sheet_content.dart';

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
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerContent(),
      ),
      extendBody: true,
      backgroundColor: Colors.white,
      body: const HomeViewBody(),

      floatingActionButton: SizedBox(
        height: 70.w,
        width: 70.w,
        child: FloatingActionButton(
          backgroundColor: ColorsManager.primaryColor,
          elevation: 8,
          shape: const CircleBorder(),
          onPressed: () {
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
                Icon(Icons.add, color: Colors.black, size: 22.sp),
                SizedBox(height: 2.h),
                Text(
                  'أضف إعلانك',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
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
