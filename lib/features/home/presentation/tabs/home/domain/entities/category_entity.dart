class CategoryEntity {
  final String id;
  final String name;
  final String imageUrl;
  final int order;
  final bool isActive;
  final DateTime createdAt;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.order,
    required this.isActive,
    required this.createdAt,
  });
}
