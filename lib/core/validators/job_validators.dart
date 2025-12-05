class JobValidators {
  static String? validateTitle(String? v) {
    if (v == null || v.trim().isEmpty) return "الاسم أو الصفة المهنية مطلوبة";
    return null;
  }

  static String? validateDescription(String? v) {
    if (v == null || v.trim().isEmpty) return "الوصف مطلوب";
    if (v.trim().length < 6) return "الوصف قصير جدًا";
    return null;
  }

  static String? validatePhone(String? v) {
    if (v == null || v.trim().isEmpty) return "رقم الهاتف مطلوب";
    if (v.length < 8) return "رقم الهاتف غير صالح";
    return null;
  }

  static String? validateLocation(String? v) {
    if (v == null || v.trim().isEmpty) return "الموقع مطلوب";
    if (v.trim().length < 2) return "الرجاء إدخال موقع صحيح";
    return null;
  }
}
