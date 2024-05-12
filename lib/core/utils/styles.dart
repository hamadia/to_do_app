import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
  static TextStyle title = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle time = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColors.lightPrimaryColor);
  static TextStyle add = const TextStyle(
    fontSize: 14,
  );
  static TextStyle validTime = const TextStyle(fontSize: 12, color: Colors.red);
  static TextStyle taskItem = const TextStyle(
      fontSize: 18,
      color: AppColors.lightPrimaryColor,
      fontWeight: FontWeight.bold);
}
