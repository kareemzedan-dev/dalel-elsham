import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.id,
    required super.imageUrl,
    required super.type,
    super.link,
    super.projectId,
    required super.places,
    required super.isActive,
    required super.order,
    required super.createdAt,
  });

  factory BannerModel.fromMap(Map<String, dynamic> json, String docId) {
    return BannerModel(
      id: docId,
      imageUrl: json['imageUrl'] ?? '',
      type: json['type'] ?? 'external',
      link: json['link'],
      projectId: json['projectId'],
      places: List<String>.from(json['places'] ?? []),
      isActive: json['isActive'] ?? true,
      order: json['order'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "imageUrl": imageUrl,
      "type": type,
      "link": link,
      "projectId": projectId,
      "places": places,
      "isActive": isActive,
      "order": order,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
