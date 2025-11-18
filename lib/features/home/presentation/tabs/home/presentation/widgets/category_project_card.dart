import 'package:dalel_elsham/core/components/contact_button_card.dart';
import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/services/contact_launcher_service.dart';
import '../../../../../../../core/services/phone_call_service.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../domain/entities/project_entity.dart';

class CategoryProjectCard extends StatelessWidget {
  const CategoryProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  final ProjectEntity project;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: ColorsManager.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  project.logo,
                  height: 120.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        height: 1.3.h,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16.sp,
                          color: ColorsManager.primaryColor,
                        ),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            project.location,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ContactButtonCard(
                          image: AssetsManager.phoneCall,
                          onTap: () {
                            PhoneCallService.callNumber(project.phone);
                          },
                        ),
                        SizedBox(width: 8.w),
                        ContactButtonCard(
                          image: AssetsManager.whatsapp,
                          onTap: () {
                            ContactLauncherService.openWhatsApp(project.phone);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
