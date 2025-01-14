import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DInputFieldTheme {
  DInputFieldTheme._();

  static InputDecorationTheme lightInputFieldTheme = InputDecorationTheme(
    prefixIconColor: DColors.gray,
    suffixIconColor: DColors.gray,
    labelStyle: const TextStyle().copyWith(color: DColors.darkText, fontSize: DSizes.fontMd),
    hintStyle: const TextStyle().copyWith(color: DColors.gray, fontSize: DSizes.fontSm),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: DColors.gray, fontSize: DSizes.fontSm),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: DColors.accent),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: DColors.accent),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: DColors.gray),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: DColors.redAlert),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: DColors.warningAlert),
    ),
  );
}