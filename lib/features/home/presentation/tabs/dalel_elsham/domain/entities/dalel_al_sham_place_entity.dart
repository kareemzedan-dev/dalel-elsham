class DalelAlShamPlaceEntity {
  final String id;
  final String name;
  final String description;
  final String addressText;
  final String? mapLink;
  final String phone;
  final List<String> images;

  const DalelAlShamPlaceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.addressText,
    this.mapLink,
    required this.phone,
    required this.images,
  });
}
