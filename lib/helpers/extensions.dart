import 'package:intl/intl.dart';

extension StringExtension on String {
  bool isEmailValid() {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(this);
  }
}

extension DateTimeExtension on DateTime {
  String formattedDate() {
    return DateFormat('dd/MM/yyyy HH:mm', 'pt-BR').format(this);
  }
}
