import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import 'custom_search_bar.dart';

class JobsHeader extends StatelessWidget {
  final String searchHint;

  const JobsHeader({
    super.key,
    required this.searchHint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 8.h, bottom: 8.w),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 22.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),

              Expanded(
                child: CustomSearchBar(
                  hintText: searchHint,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
