import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors_manager.dart';
import 'Job_seeker_card_list.dart';
import 'custom_search_bar.dart';

class JobSeekersViewBody extends StatelessWidget {
  const JobSeekersViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
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
                      color: Colors.black,
                      size: 22.sp,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),

                  Expanded(
                    child: CustomSearchBar(
                      hintText: "أضف طلب عمل",
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Column(children: [JobSeekerCardList()]),
            ),
          ),
        ),
      ],
    );
  }
}
