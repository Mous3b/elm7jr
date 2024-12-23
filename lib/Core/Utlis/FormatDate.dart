import 'package:intl/intl.dart';

String fromatDate({required String? value}) {
  if (value == null || value == "") {
    return '';
  }
  DateTime dateTime = DateTime.tryParse(value) ?? DateTime.now();
  String formattedDate = DateFormat('EEEE - yyyy/M/d ', 'ar').format(dateTime);
  return formattedDate;
}

String fromatTime({required String? value}) {
  if (value == null || value == "") {
    return '';
  }
  DateTime dateTime = DateTime.tryParse(value) ?? DateTime.now();
  String formattedDate = DateFormat('h:mm a', 'ar').format(dateTime);
  return formattedDate;
}
