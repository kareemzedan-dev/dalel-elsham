import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.image, required this.title});
  final String image;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(

      width: 140.w,
      decoration: BoxDecoration(
        color: Color(0XFFebebeb),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              height: 120.h,
              width: 140.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset( image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w900
              ),
            ),

          ],
        ),
      ),
    );
  }
}
