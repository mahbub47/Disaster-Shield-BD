import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/app_bar_theme.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/checkbox_theme.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/input_field_theme.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class DappTheme {
  DappTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: DColors.primary,
    scaffoldBackgroundColor: DColors.light,
    textTheme: DTextTheme.lightTextTheme,
    elevatedButtonTheme: DElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: DAppbarTheme.lightAppbarTheme,
    checkboxTheme: DCheckBoxTheme.lightCheckBoxTheme,
    inputDecorationTheme: DInputFieldTheme.lightInputFieldTheme,
  );
}