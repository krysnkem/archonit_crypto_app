import 'dart:math';

import 'package:flutter/services.dart';

class ColorGenerator {
  ColorGenerator._();
  static final Random _random = Random();
  static Color generateColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}
