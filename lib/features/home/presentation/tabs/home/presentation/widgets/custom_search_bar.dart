import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../../../../../../core/utils/assets_manager.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.showBackIcon = false, // ✅ اختياري
    this.onBackPressed, // ✅ حدث عند الضغط على السهم
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
          // 🔙 أيقونة الرجوع (اختيارية)
          if (showBackIcon) ...[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20.sp,
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            ),
            SizedBox(width: 4.w),
          ],

          // 🔍 حقل الكتابة
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              textAlignVertical: TextAlignVertical.center,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 6.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AssetsManager.syria,
                        height: 22.h,
                        width: 22.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 4.w),
                    ],
                  ),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
