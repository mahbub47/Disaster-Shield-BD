import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DAppbarTheme {
  DAppbarTheme._();

  static const AppBarTheme lightAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: DColors.light, size: DSizes.iconLg),
    actionsIconTheme: IconThemeData(color: DColors.light, size: DSizes.iconLg),
    titleTextStyle: TextStyle(color: DColors.lightText, fontSize: 20, fontWeight: FontWeight.w600),
  );

  static const AppBarTheme lightAppbarTheme2 = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: DColors.light, size: DSizes.iconLg),
    actionsIconTheme: IconThemeData(color: DColors.light, size: DSizes.iconLg),
    titleTextStyle: TextStyle(color: DColors.lightText, fontSize: 20, fontWeight: FontWeight.w600),
  );
}
