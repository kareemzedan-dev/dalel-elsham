import 'dart:convert';
import 'package:http/http.dart' as http;

class NotificationService {
  static const String _baseUrl =
      "https://rfxticljudaqokliiugx.functions.supabase.co/clever-responder";

  /// إرسال إشعار عبر التوكن مباشرة
  static Future<bool> sendToToken({
    required String token,
    required String title,
    required String message,
  }) async {
    return _send({
      "token": token,
      "title": title,
      "message": message,
    });
  }

  /// إرسال إشعار عبر userId (ويتم جلب fcmToken داخل السيرفر)
  static Future<bool> sendToUser({
    required String userId,
    required String title,
    required String message,
  }) async {
    return _send({
      "userId": userId,
      "title": title,
      "message": message,
    });
  }

  /// الدالة الأساسية لإرسال الطلب
  static Future<bool> _send(Map<String, dynamic> payload) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        print("✅ Notification sent successfully");
        print(response.body);
        return true;
      } else {
        print("❌ Failed: ${response.statusCode}");
        print(response.body);
        return false;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return false;
    }
  }
}
