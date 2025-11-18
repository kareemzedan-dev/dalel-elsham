import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectDetailsWorkTime extends StatelessWidget {
  const ProjectDetailsWorkTime({super.key,
    required this.workTimeFrom,
    required this.workTimeTo,
  });
  final String workTimeFrom;
  final String workTimeTo;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.access_time, size: 16.sp),
            SizedBox(width: 8.w),
            Text(
               "وقت العمل : من الساعة $workTimeFrom إلى الساعة $workTimeTo",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                height: 1.6,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
