import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DTextTheme {
  DTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: DSizes.fontXl, fontWeight: FontWeight.w600, color: DColors.darkText),
    headlineMedium: const TextStyle().copyWith(fontSize: DSizes.fontMd, fontWeight: FontWeight.w600, color: DColors.darkText),
    headlineSmall: const TextStyle().copyWith(fontSize: DSizes.fontSm, fontWeight: FontWeight.w500, color: DColors.darkText),

    bodyMedium: const TextStyle().copyWith(fontSize: DSizes.fontMd, fontWeight: FontWeight.w400, color: DColors.darkText),

    labelLarge: const TextStyle().copyWith(fontSize: DSizes.fontMd, fontWeight: FontWeight.w500, color: DColors.gray),
    labelMedium: const TextStyle().copyWith(fontSize: DSizes.fontMd, fontWeight: FontWeight.w600, color: DColors.darkText),
    labelSmall: const TextStyle().copyWith(fontSize: DSizes.fontSm, fontWeight: FontWeight.w400, color: DColors.gray),
  );
}