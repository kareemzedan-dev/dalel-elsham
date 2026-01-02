class JobEntity {
  final String id;
  final String title;
  final String description;
  final String type;
  final String phone;
  final String? applyLink ; 
  final String location;
  final String imageUrl;
  final bool isActive;
  final String status;
  final int duration;  
  final DateTime createdAt;


  const JobEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.phone,
      this.applyLink,
    required this.location,
    required this.imageUrl,
    required this.isActive,
    required this.status,
    required this.duration,
    required this.createdAt,

  });
}
