class ProjectEntity {
  final String id;
  final String title;
  final String description;
  final String categoryTitle;
  final String phone;
  final String logo;
  final String location;
  final String? mapLink;

  final bool isActive;
  final String duration;
  final String tier;
  final String createdAt;
  final String status;

  final List<String> images;
  final List<String> additionalImages;

  final String? whatsapp;
  final String? facebook;
  final String? instagram;
  final String? website;

  final int views;

  final String? workTimeFrom;
  final String? workTimeTo;

  ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryTitle,
    required this.images,
    required this.logo,
    required this.phone,
    required this.location,
    this.mapLink,              // هنا
    required this.isActive,
    required this.duration,
    required this.createdAt,
    required this.status,
    required this.additionalImages,
    required this.tier,
    this.whatsapp,
    this.facebook,
    this.instagram,
    this.website,
    this.views = 0,
    this.workTimeFrom,
    this.workTimeTo,
  });
}
