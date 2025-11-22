import 'package:url_launcher/url_launcher.dart';

class ContactLauncherService {

  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print("❌ Cannot open URL: $url");
    }
  }

  static Future<void> openWhatsApp(String phone) async {
    final cleanedPhone = _formatPhone(phone);
    final Uri uri = Uri.parse("https://wa.me/$cleanedPhone");

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print("❌ Cannot open WhatsApp");
    }
  }

  static Future<void> openMapByLink(String link) async {
    final Uri uri = Uri.parse(link);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print("❌ Cannot open Maps");
    }
  }

  static String _formatPhone(String phone) {
    String digits = phone.replaceAll(RegExp(r'[^0-9]'), "");

    if (digits.startsWith("963")) return digits;

    if (digits.startsWith("0")) digits = digits.substring(1);

    return "963$digits";
  }
}
