import 'package:share_plus/share_plus.dart';

class ShareService {
  /// مشاركة نص جاهز
  static Future<void> shareTemplate({
    required String title,
    required String url,
    String? description,
    String? location,
    String? phone,
  }) async {
    String content = "";

    // العنوان
    content += "📌 $title\n\n";

    // الوصف
    if (description != null && description.isNotEmpty) {
      content += "$description\n\n";
    }

    // رقم الهاتف
    if (phone != null && phone.isNotEmpty) {
      content += "📞 للتواصل: $phone\n";
    }

    // الموقع
    if (location != null && location.isNotEmpty) {
      content += "📍 الموقع: $location\n";
    }

    // الرابط
    content += "\n🔗 للمزيد: $url";

    await Share.share(content);
  }

  /// مشاركة رابط فقط
  static Future<void> shareLink(String url) async {
    if (url.isEmpty) return;
    await Share.share(url);
  }

  /// مشاركة نص + رابط عادي
  static Future<void> shareText({
    required String title,
    required String url,
    String? description,
  }) async {
    String content = "$title\n\n";
    if (description != null && description.isNotEmpty) {
      content += "$description\n\n";
    }
    content += url;

    await Share.share(content);
  }

  /// مشاركة صورة + نص
  static Future<void> shareImage({
    required XFile image,
    String? text,
  }) async {
    await Share.shareXFiles(
      [image],
      text: text,
    );
  }
}
