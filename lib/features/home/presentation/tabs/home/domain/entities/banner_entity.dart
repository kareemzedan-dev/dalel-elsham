class BannerEntity {
  final String id;
  final String imageUrl;
  final String type; // "external" or "internal"
  final String? link;
  final String? projectId;
  final List<String> places; // ["home", "jobs", "opportunities"]
  final bool isActive;
  final int order;
  final DateTime createdAt;
  final double? width;
  final double? height;

  const BannerEntity({
    required this.id,
    required this.imageUrl,
    required this.type,
    this.link,
    this.projectId,
    required this.places,
    required this.isActive,
    required this.order,
    required this.createdAt,
    this.width,
    this.height,
  });
}
