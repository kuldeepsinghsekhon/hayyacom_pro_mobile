
import 'package:flutter/material.dart';

import 'theme_colors.dart';
import 'theme_model.dart';

class AppTheme {
  static ThemeModel themeData = ThemeModel(
    colors: ThemeColors.light(),
  );

  static void setTheme(bool isDark) {
    if (isDark) {
      themeData = ThemeModel(
          colors: ThemeColors.dark());
    } else {
      themeData = ThemeModel(
          colors: ThemeColors.light());
    }
  }

  static ThemeColors get themeColors {
    return themeData.colors;
  }
}