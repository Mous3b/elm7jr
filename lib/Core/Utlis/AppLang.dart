import 'package:intl/intl.dart';

abstract class AppLang {
  static bool isArabic() {
    return Intl.getCurrentLocale() == "ar";
  }
}
