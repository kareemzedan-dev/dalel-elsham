import 'package:dalel_elsham/features/home/presentation/tabs/dalel_elsham/presentation/widgets/sponsored_banner.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/banner_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_manager.dart';
import 'featured_place_card.dart';
import 'featured_place_card_list.dart';

class DalelElshamTabViewBody extends StatelessWidget {
  const DalelElshamTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SponsoredBanner(image: AssetsManager.banner,),
              SizedBox(height: 16.h,),
              FeaturedPlaceCardList()

            ],
          ),
        ),
      ),
    );
  }
}
