import 'package:flutter/material.dart';

enum SizedBoxEnum { SMALL, MEDIUM, LARGE }

extension SizedBoxExtension on SizedBoxEnum {
  Widget get showSizedBox {
    switch (this) {
      case SizedBoxEnum.SMALL:
        return const SizedBox(
          height: 10,
        );
      case SizedBoxEnum.MEDIUM:
        return const SizedBox(
          height: 20,
        );
      case SizedBoxEnum.LARGE:
        return const SizedBox(
          height: 40,
        );
    }
  }
}
