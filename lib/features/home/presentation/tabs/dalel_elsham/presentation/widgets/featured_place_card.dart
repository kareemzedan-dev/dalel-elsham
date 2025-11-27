import 'package:dalel_elsham/core/components/contact_button_card.dart';
import 'package:dalel_elsham/core/services/phone_call_service.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/domain/entities/dalel_al_sham_place_entity.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/banner_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/services/contact_launcher_service.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../../home/domain/entities/banner_entity.dart';

class FeaturedPlaceCard extends StatelessWidget {
  const FeaturedPlaceCard({super.key, required this.place});

  final DalelAlShamPlaceEntity place;

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
                child: BannerSection(
                  showDotsOnTop: true,
                  disableAutoPlay: true,
                  useFill: true,
                  imageHeight: 200.h,
                  images: place.images.map((img) {
                    return BannerEntity(
                      id: UniqueKey().toString(),
                      imageUrl: img,
                      type:"",
                      link: null,
                      projectId: null,
                      places: ["dalel_al_sham"],
                      isActive: true,
                      order: 0,
                      createdAt: DateTime.now(),
                    );
                  }).toList(),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.name,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),

                          Text(
                            place.description,
                            textAlign: TextAlign.justify,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              fontSize: 14.sp,
                            ),
                          ),

                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 16.sp),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  place.addressText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    SizedBox(width: 12.w),

                    Row(
                      children: [
                        if ((place.phone ?? "").isNotEmpty)
                          ContactButtonCard(
                            image: AssetsManager.phoneCall,
                            onTap: () {
                              PhoneCallService.callNumber(place.phone!);
                            },
                          ),

                        SizedBox(width: 8.w),

                        if ((place.mapLink ?? "").isNotEmpty)
                          ContactButtonCard(
                            image: AssetsManager.location,
                            onTap: () {
                              ContactLauncherService.openMapByLink(
                                place.mapLink!,
                              );
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
