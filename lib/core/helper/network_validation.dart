import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkValidation {
  static Future<bool> hasInternet() async {
    // Check if device has WiFi/Mobile connection first
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      return false;
    }

    // Check real internet by pinging Google DNS
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // internet working
      }
      return false;
    } catch (e) {
      return false; // no internet
    }
  }
}
