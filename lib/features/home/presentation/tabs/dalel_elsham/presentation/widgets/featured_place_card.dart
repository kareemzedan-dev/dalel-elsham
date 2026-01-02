import 'package:dalel_elsham/core/components/contact_button_card.dart';
import 'package:dalel_elsham/core/services/phone_call_service.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/domain/entities/dalel_al_sham_place_entity.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/banner_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/components/expanded_text.dart';
import '../../../../../../../core/services/contact_launcher_service.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../../home/domain/entities/banner_entity.dart';

class FeaturedPlaceCard extends StatelessWidget {
  const FeaturedPlaceCard({super.key, required this.place});

  final DalelAlShamPlaceEntity place;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.only(  bottom: 12.h, left: 12.w, right: 12.w, top: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
     
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
            
                child: SizedBox(
                  width: 130.w,
             
                  child: BannerSection(
                    compactMode: true,
                    showDotsOnTop: false,
                    disableAutoPlay: true,
                    useFill: true,
                    imageHeight: 120.h,  
                    images: place.images.map((img) {
                      return BannerEntity(
                        id: UniqueKey().toString(),
                        imageUrl: img,
                        type: "",
                        link: null,
                        projectId: null,
                        places: const ["dalel_al_sham"],
                        isActive: true,
                        order: 0,
                        createdAt: DateTime.now(),
                      );
                    }).toList(),
                  ),
                ),
              ),
          
              SizedBox(width: 12.w),
          
              /// ================= LEFT CONTENT =================
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// الاسم
                    Text(
                      place.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
          
                    SizedBox(height: 6.h),
          
                    /// الوصف
                       ExpandableText(text: place.description),
          
                 
                     
                  ],
                ),
              ),
              SizedBox(width: 12.w),
                  Column(
                      children: [
                        if ((place.phone ?? "").isNotEmpty)
                          ContactButtonCard(
                            height: 50.h,
                            width: 50.w,
          
                            image: AssetsManager.phoneCall,
                            onTap: () {
                              PhoneCallService.callNumber(place.phone!);
                            },
                          ),
          
                        SizedBox(height: 8.w),
          
                        if ((place.mapLink ?? "").isNotEmpty)
                          ContactButtonCard(
                                height: 50.h,
                            width: 50.w,
                            image: AssetsManager.location,
                            onTap: () {
                              ContactLauncherService.openMapByLink(place.mapLink!);
                            },
                          ),
                      ],
                    ),
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        place.addressText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
