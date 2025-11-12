import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/assets_manager.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../widgets/custom_search_bar.dart';

class JobOpportunitiesViewBody extends StatelessWidget {
  const JobOpportunitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomSearchBar(
                hintText: "فرص عمل بالشام",
                onChanged: (value) {},
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SponsoredBanner(image: AssetsManager.banner),
                SizedBox(height: 16.h),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
