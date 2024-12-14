abstract class ValidationMethod {
  static String? itemName({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل اسم المنتج";
    }

    return null;
  }

  static String? itemQty({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل كمية المنتج";
    }

    return null;
  }

  static String? itemPrice({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل سعر المنتج";
    }

    return null;
  }
}
