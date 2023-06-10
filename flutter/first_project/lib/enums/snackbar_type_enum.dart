import 'package:flutter/material.dart';

enum SnackBarTypeEnum {
  SUCCESS,
  WARNING,
  ERROR,
}

///
extension SnackBarTypeExtension on SnackBarTypeEnum {
  String get message {
    switch (this) {
      case SnackBarTypeEnum.SUCCESS:
        return "Success!";
      case SnackBarTypeEnum.WARNING:
        return "Warning!";
      case SnackBarTypeEnum.ERROR:
        return "Error!";
    }
  }

  Color get color {
    switch (this) {
      case SnackBarTypeEnum.SUCCESS:
        return Colors.green;
      case SnackBarTypeEnum.WARNING:
        return Colors.yellow;
      case SnackBarTypeEnum.ERROR:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case SnackBarTypeEnum.SUCCESS:
        return Icons.check;
      case SnackBarTypeEnum.WARNING:
        return Icons.warning;
      case SnackBarTypeEnum.ERROR:
        return Icons.error;
    }
  }
}
