import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../../../../../../core/utils/assets_manager.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.showBackIcon = false,
    this.onBackPressed,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final bool showBackIcon;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showBackIcon) ...[
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black, size: 20.sp),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            ),
            SizedBox(width: 4.w),
          ],

          Expanded(
            child: Center(
              child: TextField(
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.center,

                onChanged: onChanged,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),

                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: false,



                  // ⭐ العلم — ضبط الارتفاع علشان ما يلغبطش النص
                  prefixIcon: SizedBox(
                    width: 40.w,
                    child: Center(
                      child: Image.asset(
                        AssetsManager.country,
                        height: 18.h,
                        width: 22.w,
                      ),
                    ),
                  ),

                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),


                  suffixIcon: SizedBox(
                    width: 40.w,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.5),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
