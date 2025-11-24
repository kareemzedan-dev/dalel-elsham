import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  final String image, title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(1.r),
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,

              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: image.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      height: 50.h,
                      width: 50.w,
                      placeholder: (_, __) => Container(
                        height: 50.h,
                        width: 50.w,
                        color: Colors.black12,
                      ),
                      errorWidget: (_, __, ___) =>
                          Icon(Icons.error, size: 20.sp, color: Colors.red),
                    )
                  : Container(
                      color: ColorsManager.primaryColor,
                      height: 50.h,
                      width: 50.w,
                    ),
            ),
          ),

          SizedBox(height: 8.h),
          AutoSizeText(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            minFontSize: 6,
            maxFontSize: 13,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
