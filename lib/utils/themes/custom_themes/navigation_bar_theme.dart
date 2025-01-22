import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class DNavigationBarTheme {
  DNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme =
  NavigationBarThemeData(
    iconTheme: const WidgetStatePropertyAll(IconThemeData(size: 25,color: DColors.dark)),
    indicatorColor: DColors.accent.withOpacity(0.5),
    labelTextStyle:
    WidgetStatePropertyAll(DTextTheme.lightTextTheme.labelSmall),
  );
}
