class AppLinkEntity {
  final String id;        // Document ID
  final String type;      // نوع الرابط (share_app, contact_us...)
  final String title;     // الاسم الظاهر للمستخدم
  final String url;       // الرابط نفسه
  final DateTime? updatedAt;

  AppLinkEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.url,
    this.updatedAt,
  });
}
