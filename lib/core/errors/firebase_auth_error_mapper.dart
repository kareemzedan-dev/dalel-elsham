class FirebaseAuthErrorMapper {
  static String getMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return "هذا البريد مسجّل بالفعل.";
      case 'invalid-email':
        return "البريد الإلكتروني غير صالح.";
      case 'user-not-found':
        return "هذا الحساب غير موجود.";
      case 'wrong-password':
        return "كلمة المرور غير صحيحة.";
      case 'weak-password':
        return "كلمة المرور ضعيفة جدًا.";
      case 'too-many-requests':
        return "عدد محاولات تسجيل الدخول كبير جدًا، حاول لاحقًا.";
      case 'network-request-failed':
        return "لا يوجد اتصال بالإنترنت.";
      case 'operation-not-allowed':
        return "هذا النوع من تسجيل الدخول غير مُفعّل.";
      default:
        return "حدث خطأ غير متوقع، حاول مرة أخرى.";
    }
  }

  static String fromExceptionMessage(String firebaseMessage) {
    try {
      final code = firebaseMessage
          .split(']')
          .first
          .replaceAll('[firebase_auth/', '');
      return getMessage(code);
    } catch (_) {
      return "حدث خطأ غير متوقع.";
    }
  }
}
