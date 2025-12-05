import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  static const String _baseUrl =
      "https://rfxticljudaqokliiugx.functions.supabase.co/clever-responder";

  /// 🔥 Cache for admin tokens
  static List<String> _adminTokensCache = [];

  /// ================================================================
  /// 🔵 تحميل توكنات الإدمن مرة واحدة فقط وتخزينها في Cache
  /// ================================================================
  static Future<void> loadAdminTokens() async {
    final snap = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "admin")
        .get();

    _adminTokensCache = snap.docs
        .map((d) => d.data()["fcmToken"] as String? ?? "")
        .where((t) => t.isNotEmpty)
        .toList();

    print("🔵 Loaded Admin Tokens: ${_adminTokensCache.length}");
  }

  /// ================================================================
  /// 🔵 إرسال إشعار إلى كل الإدمنز مرة واحدة
  /// ================================================================
  static Future<bool> sendToAllAdmins({
    required String title,
    required String message,
  }) async {
    if (_adminTokensCache.isEmpty) {
      print("⚠️ Admin tokens empty — loading...");
      await loadAdminTokens();
    }

    bool allSucceeded = true;

    for (final token in _adminTokensCache) {
      final success = await sendToToken(
        token: token,
        title: title,
        message: message,
      );

      if (!success) {
        allSucceeded = false;
      }
    }

    return allSucceeded;
  }

  /// ================================================================
  /// 🔵 إرسال إشعار إلى User واحد
  /// ================================================================
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

  /// ================================================================
  /// 🔵 إرسال إشعار إلى توكن واحد
  /// ================================================================
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

  /// ================================================================
  /// 🔵 الدالة الأساسية للإرسال
  /// ================================================================
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
