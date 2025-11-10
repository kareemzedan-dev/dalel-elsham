import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors_manager.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 180.h + topPadding,
          width: double.infinity,
          child: ClipPath(
            clipper: _SmoothHeaderClipper(),
            child: Container(
              padding: EdgeInsets.only(top: topPadding),
              color: ColorsManager.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 38.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: ColorsManager.primaryColor,
                      size: 38.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    ' مرحبًا بك 👋 كريم',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


        _buildDrawerItem(Icons.home, 'الرئيسية', context),
        _buildDrawerItem(Icons.info, 'عن التطبيق', context),
        _buildDrawerItem(Icons.settings, 'الإعدادات', context),
      ],
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorsManager.primaryColor),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {},
    );
  }
}


class _SmoothHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
