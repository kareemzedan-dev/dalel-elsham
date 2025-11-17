import 'package:url_launcher/url_launcher.dart';

class PhoneCallService {
  static Future<void> callNumber(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw Exception("لا يمكن فتح تطبيق الاتصال");
    }
  }
}
