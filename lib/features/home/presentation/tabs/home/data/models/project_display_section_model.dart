import '../../domain/entities/project_display_section_entity.dart';

class ProjectDisplaySectionModel extends ProjectDisplaySectionEntity {
  const ProjectDisplaySectionModel({
    required super.id,
    required super.title,
    required super.order,
    required super.isActive,
    required super.createdAt,
  });

  /// ------------------------------
  /// 🔵 FROM MAP
  /// ------------------------------
  factory ProjectDisplaySectionModel.fromMap(
      Map<String, dynamic> map, String id) {
    return ProjectDisplaySectionModel(
      id: id,
      title: map['title'] ?? "",
      order: map['order'] ?? 0,
      isActive: map['isActive'] ?? true,
      createdAt: DateTime.tryParse(map['createdAt'] ?? "") ?? DateTime.now(),
    );
  }

  /// ------------------------------
  /// 🔵 TO MAP
  /// ------------------------------
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "order": order,
      "isActive": isActive,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  /// لو حابب تستخدمها في الدومين:
  ProjectDisplaySectionEntity toEntity() => ProjectDisplaySectionEntity(
    id: id,
    title: title,
    order: order,
    isActive: isActive,
    createdAt: createdAt,
  );
}
