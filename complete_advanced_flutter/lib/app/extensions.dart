import 'package:complete_advanced_flutter/app/utils.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    }
    return this!;
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    }
    return this!;
  }
}
