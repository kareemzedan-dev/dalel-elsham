import 'package:url_launcher/url_launcher.dart';

class PhoneCallService {
  static Future<void> callNumber(String phoneNumber) async {
    // حذف أي شيء ليس رقم
    String cleaned = phoneNumber.replaceAll(RegExp(r'[^0-9]'), "");

    const syCode = "+963";

    // لو الرقم يبدأ بـ 0 نشيله
    if (cleaned.startsWith("0")) {
      cleaned = cleaned.substring(1);
    }

    String finalNumber = "$syCode$cleaned";

    final Uri uri = Uri(scheme: 'tel', path: finalNumber);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("لا يمكن فتح تطبيق الاتصال");
    }
  }
}
