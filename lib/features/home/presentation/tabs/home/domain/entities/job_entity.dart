class JobEntity {
  final String id;
  final String title;
  final String description;
  final String type;
  final String phone;
  final String location;
  final String imageUrl;
  final bool isActive;
  final String status;
  final int duration; // عدد الأيام التي يظل فيها الإعلان فعال
  final DateTime createdAt;

  const JobEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.phone,
    required this.location,
    required this.imageUrl,
    required this.isActive,
    required this.status,
    required this.duration,
    required this.createdAt,

  });
}
