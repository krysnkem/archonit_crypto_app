import 'dart:math';

import 'package:flutter/services.dart';

class ColorGenerator {
  ColorGenerator._();
  static final Random _random = Random();
  static Color generateColor() {
    // Generate from full RGB spectrum (16,777,216 colors)
    // Using semi-transparent colors for better visual appeal
    return Color.fromARGB(
      180, // Semi-transparent for better readability
      _random.nextInt(256), // Red: 0-255
      _random.nextInt(256), // Green: 0-255
      _random.nextInt(256), // Blue: 0-255
    );
  }
}
