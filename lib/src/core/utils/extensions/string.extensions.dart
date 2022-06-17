import 'package:flutter/material.dart';

extension StringExtensions on String {
  int? toInt() {
    final val = int.tryParse(this);
    return val;
  }

  double? toDouble() {
    final val = double.tryParse(this);
    return val;
  }

  num? toNum() {
    final val = num.tryParse(this);
    return val;
  }

  bool toBool() {
    if (isNotEmpty) {
      final intValue = toInt();
      if (intValue != null && intValue >= 1) {
        return true;
      } else if (trim().toLowerCase() == 'true') {
        return true;
      }
    }
    return false;
  }

  Color? hexToColor() {
    if (isEmpty) {
      return null;
    }
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
