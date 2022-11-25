import 'package:flutter/material.dart';

class AppColors {
  static const backgroundColor = Color.fromARGB(255, 238, 246, 255);
  static const textColor = Colors.black;
  static const primaryColor = Colors.blue;
  static const colorBlack1 = Color.fromARGB(255, 68, 64, 64);
  static List<BoxShadow> shadowWidget = [
    BoxShadow(
      color: AppColors.textColor.withOpacity(0.3),
      blurRadius: 4.0,
    ),
  ];
}
