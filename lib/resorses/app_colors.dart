import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Colors.blue;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color yellow = Colors.yellow;
  static const Color green = Color(0XFF00A86B);
  static final random = Random();
  static Color getRandomColor() {
    return Color.fromARGB(
        255, random.nextInt(200), random.nextInt(200), random.nextInt(200));
  }
}
