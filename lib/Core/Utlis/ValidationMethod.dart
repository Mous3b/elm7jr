abstract class ValidationMethod {
  static String? supplierName({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل اسم المورد";
    }

    return null;
  }

  static String? supplierPhone({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل رقم المورد";
    }
    if (value.length > 11 || value.length < 11) {
      return "رقم المورد يجب ان يكون 11 رقم";
    }

    return null;
  }

  static String? customerName({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل اسم الزبون";
    }

    return null;
  }

  static String? customerPhone({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل رقم الزبون";
    }
    if (value.length > 11 || value.length < 11) {
      return "رقم المورد يجب ان يكون 11 رقم";
    }

    return null;
  }

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

  static String? payAmount({required String? value}) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return "ادخل قيمة الدفعة";
    }

    return null;
  }
}
