import 'package:intl/intl.dart';

String fromatDate({required String? value}) {
  if (value == null || value == "") return '';
  DateTime dateTime = DateTime.parse(value);
  String formattedDate = DateFormat('EEEE - yyyy/M/d ', 'ar').format(dateTime);
  return formattedDate;
}
