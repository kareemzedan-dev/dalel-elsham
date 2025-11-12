import 'package:flutter/cupertino.dart';

import 'featured_place_card.dart';

class FeaturedPlaceCardList extends StatelessWidget {
  const FeaturedPlaceCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return   FeaturedPlaceCard(
          title: "جبل قاسيون",
          description: "يمكنك الذهاب إلى الموقع أو التواصل معهم على الرقم مباشرة. يُعد جبل قاسيون من أبرز المعالم في دمشق، ويتميز بإطلالته الجميلة على المدينة.",
          location: "الشام",
        );
      },
    );
  }
}
