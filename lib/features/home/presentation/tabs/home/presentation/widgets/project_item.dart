import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/project_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../config/routes/routes_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../manager/projects/update_project_views_view_model/update_project_views_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.projectEntity});

  final ProjectEntity projectEntity;

  Color _getBadgeColor() {
    if (projectEntity.tier == "gold") return Colors.amber;
    if (projectEntity.tier == "silver") return Colors.blueGrey;
    return Colors.transparent;
  }

  bool _showBadge() {
    return projectEntity.tier == "gold" || projectEntity.tier == "silver";
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.read<UpdateProjectViewsViewModel>().updateProjectViews(
          projectEntity.id,
        );
        Navigator.pushNamed(
          context,
          RoutesManager.projectDetails,
          arguments: {
            "projectId": projectEntity.id,
            "projectName": projectEntity.title,
            "watchCount": projectEntity.views,
          },
        );
      },
      child: Stack(
        children: [

          /// ---------- OUTER BORDER (Gold/Silver Only) ----------
          Container(
            width: 150.w,
          height: 250.h,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: _showBadge()
                  ? Border.all(
                color: _getBadgeColor(),
                width: 2.w,
              )
                  : null,
            ),
            child: Container(

              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isDark
                    ? ColorsManager.grey.withOpacity(0.5)
                    : ColorsManager.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.r),

                /// الكارد الأساسية يكون لها border واحد بس
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1.w,
                ),
              ),
              child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// IMAGE
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    height: 120.h,
                    width: double.infinity,
                    child: projectEntity.logo.isNotEmpty
                        ? CachedNetworkImage(
                      imageUrl: projectEntity.logo,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(
                        color: Colors.black12,
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (_, __, ___) => Container(
                        color: Colors.black12,
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.red,
                          size: 30.sp,
                        ),
                      ),
                    )
                        : Container(color: Colors.grey.withOpacity(0.2)),
                  ),
                ),

                SizedBox(height: 10.h),

                /// TITLE
                Text(
                  projectEntity.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.sp,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 4.h),

                /// DESCRIPTION
                Text(
                  projectEntity.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    height: 1.2,
                    color: Colors.grey[700],
                  ),
                ),

                /// هذا هو السر 🔥
                Spacer(),

                /// LOCATION — دايماً تحت
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16.sp,
                      color: ColorsManager.primaryColor,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        projectEntity.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

      ),
          ),

          /// BADGE
          if (_showBadge())
            Positioned(
              top: 14.h,
              left: 14.w,
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getBadgeColor(),
                ),
                child: Icon(
                  Icons.workspace_premium,
                  size: 18.sp,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
