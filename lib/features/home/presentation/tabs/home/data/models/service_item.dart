import 'dart:ui';

class ServiceItemModel {
  final String image;
  final String ?  route;
  final bool ? isSoon ; 

  ServiceItemModel({
    required this.image,
      this.route,
    this.isSoon
  });
}
