import '../../domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.categoryTitle,
    required super.images,
    required super.logo,
    required super.phone,
    required super.location,
    required super.isActive,
    required super.duration,
    required super.createdAt,
    required super.status,
    required super.additionalImages,
    required super.tier,
  });

  /// ------------------------------
  /// 🔵 FROM MAP
  /// ------------------------------
  factory ProjectModel.fromMap(Map<String, dynamic> map, String id) {
    return ProjectModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      categoryTitle: map['categoryTitle'] ?? '',
      phone: map['phone'] ?? '',
      logo: map['logo'] ?? '',
      location: map['location'] ?? '',
      isActive: map['isActive'] ?? false,
      duration: map['duration'] ?? '',
      tier: map['tier'] ?? 'normal', // normal / silver / gold
      createdAt: map['createdAt'] ?? '',
      status: map['status'] ?? 'pending',

      images: List<String>.from(map['images'] ?? []),
      additionalImages: List<String>.from(map['additionalImages'] ?? []),
    );
  }

  /// ------------------------------
  /// 🔵 TO MAP
  /// ------------------------------
  Map<String, dynamic> toMap() {
    return {
      'id': id,                       // مهم تضيفه لو عايز تحفظه
      'title': title,
      'description': description,
      'categoryTitle': categoryTitle,
      'phone': phone,
      'logo': logo,
      'location': location,
      'isActive': isActive,
      'duration': duration,
      'tier': tier,
      'createdAt': createdAt,
      'status': status,
      'images': images,
      'additionalImages': additionalImages,
    };
  }
}
