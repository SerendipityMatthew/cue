import 'dart:developer' as developer;

import 'package:intl/intl.dart';

class NumberUtils {
  static String formatBaudrate(int baudRate) {
    var formatter;
    developer.log("baudRate = $baudRate");
    developer.log("baudRate.toString().length = ${baudRate.toString().length}");

    if (baudRate.toString().length == 4) {
      formatter = NumberFormat('0,000');
    } else if (baudRate.toString().length == 5) {
      formatter = NumberFormat('00,000');
    } else if (baudRate.toString().length == 6) {
      formatter = NumberFormat('000,000');
    } else if (baudRate.toString().length == 7) {
      formatter = NumberFormat('0,000,000');
    } else if (baudRate.toString().length == 8) {
      formatter = NumberFormat('00,000,000');
    } else if (baudRate.toString().length == 9) {
      formatter = NumberFormat('000,000,000');
    }
    String formatterValue = formatter.format(baudRate);
    developer.log("formatterValue = $formatterValue");
    return formatterValue;
  }
}
