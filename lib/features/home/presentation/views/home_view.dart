import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0; // ✅ لحفظ الزر الحالي

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),

      floatingActionButton: SizedBox(
        height: 80.h,
        width: 80.w,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorsManager.primaryColor,
          elevation: 5,
          shape: const CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.black, size: 24.sp),
              SizedBox(height: 2.h),
              Text(
                'أضف اعلانك',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 📦 الشريط السفلي
      bottomNavigationBar: BottomAppBar(
        shape: CustomFABNotchedShape(),
        notchMargin: 8,
        elevation: 8,
        color: Colors.white,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 🔹 الزر الأول
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.house,
                      size: 24.sp,
                      color: currentIndex == 0
                          ? ColorsManager.primaryColor
                          : Colors.grey,
                    ),
                    Text(
                      'الرئيسيه',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: currentIndex == 0
                            ? ColorsManager.primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // 🔹 الزر الثاني
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.mapLocation,
                      size: 24.sp,
                      color: currentIndex == 1
                          ? ColorsManager.primaryColor
                          : Colors.grey,
                    ),
                    Text(
                      'دليل الشام',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: currentIndex == 1
                            ? ColorsManager.primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFABNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null) {
      return Path()..addRect(host);
    }

    const double smoothness = 8;
    final double notchRadius = guest.width / 2 + 8;

    final double notchCenter = guest.center.dx;
    final double notchStart = notchCenter - notchRadius - smoothness;
    final double notchEnd = notchCenter + notchRadius + smoothness;

    final path = Path()..moveTo(host.left, host.top);
    path.lineTo(notchStart, host.top);

    // 👇 منحنى لتحت
    path.quadraticBezierTo(
      notchCenter,
      host.top + 25, // عمق المنحنى لتحت
      notchEnd,
      host.top,
    );

    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();

    return path;
  }
}
