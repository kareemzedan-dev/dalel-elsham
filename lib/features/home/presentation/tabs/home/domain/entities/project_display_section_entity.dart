class ProjectDisplaySectionEntity {
  final String id;            // example: featured, newest, etc.
  final String title;         // عنوان القسم
  final int order;            // ترتيب الظهور
  final bool isActive;        // هل القسم مفعّل؟
  final DateTime createdAt;   // تاريخ الإنشاء

  const ProjectDisplaySectionEntity({
    required this.id,
    required this.title,
    required this.order,
    required this.isActive,
    required this.createdAt,
  });
}
