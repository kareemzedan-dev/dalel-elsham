import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  if (url.isEmpty) {
    throw Exception("❌ URL is empty");
  }

  final uri = Uri.tryParse(url);

  if (uri == null || !uri.hasScheme) {
    throw Exception("❌ Invalid URL: $url");
  }

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception("❌ Cannot launch $url");
  }
}
