import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors_manager.dart';
import 'Job_seeker_card_list.dart';
import 'custom_search_bar.dart';
import 'jobs_header.dart';

class JobSeekersViewBody extends StatelessWidget {
  const JobSeekersViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JobsHeader(searchHint: "أضف طلب عمل"),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const JobSeekerCardList(),
            ),
          ),
        ),
      ],
    );

  }
}
