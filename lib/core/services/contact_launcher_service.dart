import 'package:url_launcher/url_launcher.dart';

class ContactLauncherService {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url.trim());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("❌ Cannot open URL: $url");
    }
  }

  static Future<void> openWhatsApp(String phone) async {
    final cleanedPhone = _formatSyrianPhone(phone);
    final url = "https://wa.me/$cleanedPhone";
    await openUrl(url);
  }

  static Future<void> sendSms(String phone) async {
    final cleanedPhone = _formatSyrianPhone(phone);
    final url = "sms:$cleanedPhone";
    await openUrl(url);
  }

  static String _formatSyrianPhone(String phone) {
    String digits = phone.replaceAll(RegExp(r'[^0-9]'), "");
    if (digits.startsWith("963")) {
      return digits;
    }
    if (digits.startsWith("0")) {
      digits = digits.substring(1);
    }
    return "963$digits";
  }
}
