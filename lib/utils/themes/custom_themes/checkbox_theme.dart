import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DCheckBoxTheme {
  DCheckBoxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if(states.contains(WidgetState.selected)){
        return DColors.light;
      }else {
        return DColors.dark;
      }
    }),

    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return DColors.primary;
      }else {
        return DColors.light;
      }
    }),
  );
}