
import '../../domain/entities/app_link_entity.dart';

class AppLinkModel extends AppLinkEntity {
  AppLinkModel({
    required super.id,
    required super.type,
    required super.title,
    required super.url,
    super.updatedAt,
  });

  factory AppLinkModel.fromMap(Map<String, dynamic> map, String id) {
    return AppLinkModel(
      id: id,
      type: map['type'] ?? '',
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      updatedAt: map['updatedAt'] != null
          ? DateTime.tryParse(map['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'title': title,
      'url': url,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
