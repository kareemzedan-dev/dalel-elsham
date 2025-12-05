class RegisterValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "هذا الحقل مطلوب";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "هذا الحقل مطلوب";
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "بريد إلكتروني غير صالح";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "هذا الحقل مطلوب";
    }
    if (value.length < 6) {
      return "كلمة المرور قصيرة جداً";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "رقم الهاتف مطلوب";
    }
    if (value.length < 8) {
      return "رقم الهاتف غير صالح";
    }
    return null;
  }
}
