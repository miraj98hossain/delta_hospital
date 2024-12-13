import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension FormatDateTime on DateTime {
  String toFormatedString(String pattern) {
    try {
      return DateFormat(pattern).format(this);
    } catch (e) {
      return "";
    }
  }
}
