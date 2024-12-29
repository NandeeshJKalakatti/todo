import 'package:flutter/material.dart';

import 'app_color.dart';

class AppFonts {
  static const String poppins = 'Poppins';
  static const String allRounderMonumentTest = 'AllRounderMonumentTest';
  static const String varelaRound = 'VarelaRound';
}

class AppStyle {
  static const TextStyle headline = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: Colors.white70,
  );

  static const TextStyle splashText = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle btn1 = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle text7 = TextStyle(
    fontFamily: AppFonts.poppins,
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
