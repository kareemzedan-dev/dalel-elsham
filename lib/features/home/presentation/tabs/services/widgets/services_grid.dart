import 'package:dalel_elsham/config/routes/routes_manager.dart';
import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/data/models/service_item.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/widgets/service_item.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/services/widgets/custom_service_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  static final List<ServiceItemModel> services = [
    ServiceItemModel(
      image: AssetsManager.placesGuide,
      route: RoutesManager.dalelElsham,
    ),
    ServiceItemModel(
      image: AssetsManager.prayerTimes,
      route: RoutesManager.prayerTimes,
    ),
    ServiceItemModel(
      image: AssetsManager.jobOpportunities,
      route: RoutesManager.jobOpportunities,
    ),
    ServiceItemModel(
      image: AssetsManager.jobsSearch,
      route: RoutesManager.jobSeekers,
    ),
    ServiceItemModel(
      image: AssetsManager.emergencyNumbers,
  //    route: RoutesManager.jobSeekers,
      isSoon: true
    ),
    ServiceItemModel(
      image: AssetsManager.weather,
      route: RoutesManager.weather,
    ),
    ServiceItemModel(
      image: AssetsManager.exchangeRate,
      route: RoutesManager.exchangeRate,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.04,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomServiceContainer(
          image: services[index].image,
          isSoon: services[index].isSoon ?? false,
         onTap: () {
  if (services[index].isSoon == true) return;

  Navigator.pushNamed(
    context,
    services[index].route!,
  );
},

        ),
      ),
    );
  }
}
