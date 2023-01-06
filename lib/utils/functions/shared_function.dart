import 'package:intl/intl.dart';

String formatDate({required String date, required String format}) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final DateTime dateTime = formatter.parse(date);

  return DateFormat(format).format(dateTime);
}
