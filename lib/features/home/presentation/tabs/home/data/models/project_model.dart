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
    required super.mapLink,
    required super.whatsapp,
    required super.facebook,
    required super.instagram,
    required super.website,
    required super.views,
    required super.workTimeFrom,
    required super.workTimeTo,
    required super.displaySections,

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
      mapLink: map['mapLink'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      facebook: map['facebook'] ?? '',
      instagram: map['instagram'] ?? '',
      website: map['website'] ?? '',
      views: map['views'] ?? 0,
      workTimeFrom: map['workTimeFrom'] ?? '',
      workTimeTo: map['workTimeTo'] ?? '',
      displaySections: List<String>.from(map['displaySections'] ?? []),
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
      'mapLink': mapLink,
      'whatsapp': whatsapp,
      'facebook': facebook,
      'instagram': instagram,
      'website': website,
      'views': views,
      'workTimeFrom': workTimeFrom,
      'workTimeTo': workTimeTo,
      'displaySections': displaySections,
    };
  }
}
