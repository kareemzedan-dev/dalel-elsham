class ProjectValidators {
  static String? validateTitle(String value) {
    if (value.isEmpty) {
      return "العنوان مطلوب";
    }
    return null;
  }

  static String? validateDescription(String value) {
    if (value.isEmpty) {
      return "الوصف مطلوب";
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return "رقم الهاتف مطلوب";
    }
    return null;
  }

  static String? validateCategory(String value) {
    if (value.isEmpty) {
      return "القسم مطلوب";
    }
    return null;
  }

}