import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension IntgerExtension on int {
  String toTime() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat('aa hh:mm').format(dateTime);
  }
  String toDate() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }
}
