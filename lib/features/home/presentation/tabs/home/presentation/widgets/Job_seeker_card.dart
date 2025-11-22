import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/job_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/components/contact_button_card.dart';
import '../../../../../../../core/services/phone_call_service.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import 'package:intl/intl.dart';

class JobSeekerCard extends StatelessWidget {
  final JobEntity job;

  const JobSeekerCard({super.key, required this.job});

  Color _getTypeColor() {
    switch (job.type) {
      case "gold":
        return Colors.amber;
      case "silver":
        return Colors.blueGrey;
      default:
        return Colors.grey;
    }
  }

  double _getCardElevation() {
    switch (job.type) {
      case "gold":
        return 8;
      case "silver":
        return 5;
      default:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ⭐ الكارد الأساسي
        Card(
          elevation: _getCardElevation(),
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorsManager.grey.withValues(alpha: 0.2),

              // ⭐ تغيير لون الإطار حسب النوع
              border: Border.all(
                color: _getTypeColor(),
                width: 2.w,
              ),
            ),
            padding: EdgeInsets.all(12.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildUserInfo(context)),
                    _buildAvatarAndContact(),
                  ],
                ),
                SizedBox(height: 8.h),
                _buildLocationAndDate(context),
              ],
            ),
          ),
        ),

        // ⭐ البادج (وسام النوع) — Gold / Silver / Normal
        // ⭐ البادج (ميدالية بسيطة)
        Positioned(
          top: 8.h,
          left: 8.w,
          child: Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getTypeColor(), // ← اللون حسب النوع
            ),
            child: Icon(
              Icons.workspace_premium,
              size: 18.sp,
              color: Colors.white,
            ),
          ),
        ),

      ],
    );
  }

  // ---------------------------------------------------

  Widget _buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          job.title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.6,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          job.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            height: 1.6,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------

  Widget _buildLocationAndDate(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.location_on_outlined,
            size: 16.sp, color: ColorsManager.primaryColor),
        SizedBox(width: 4.w),

        Flexible(
          child: Text(
            job.location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),

        SizedBox(width: 12.w),

        Icon(Icons.access_time_rounded,
            size: 16.sp, color: ColorsManager.primaryColor),
        SizedBox(width: 4.w),

        Flexible(
          child: Text(
            DateFormat('yyyy-MM-dd').format(job.createdAt),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------

  Widget _buildAvatarAndContact() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 1.w),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Image.asset(
              AssetsManager.person,
              height: 50.h,
              width: 50.w,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        ContactButtonCard(
          image: AssetsManager.phoneCall,
          onTap: () {
            PhoneCallService.callNumber(job.phone);
          },
        ),
      ],
    );
  }
}
