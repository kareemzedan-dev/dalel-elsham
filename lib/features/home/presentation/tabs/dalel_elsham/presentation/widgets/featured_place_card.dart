import 'package:dalel_elsham/core/components/contact_button_card.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/banner_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';

class FeaturedPlaceCard extends StatelessWidget {
  const FeaturedPlaceCard({
    super.key,
    required this.title,
    required this.description,
    required this.location,
  });

  final String title;
  final String description;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2.w),
          borderRadius: BorderRadius.circular(12.r),
          color: ColorsManager.grey.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                child: const BannerSection(showDotsOnTop: true,
                  images: [
                    AssetsManager.banner,
                    AssetsManager.banner2,

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            description,
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text(
                                location,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Row(
                      children: [
                        ContactButtonCard(image: AssetsManager.phoneCall),
                        SizedBox(width: 8.w),
                        ContactButtonCard(image: AssetsManager.location),
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
