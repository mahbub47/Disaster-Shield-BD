import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DElevatedButtonTheme {
  DElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: DColors.light,
      backgroundColor: DColors.primary,
      disabledForegroundColor: DColors.dark,
      disabledBackgroundColor: DColors.gray,
      side: const BorderSide(color: DColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 100),
      textStyle: const TextStyle(fontSize: DSizes.fontLg, color: DColors.lightText, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    ),
  );
}