import 'package:first_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class UtilFunction {
  static bool isDarkMode(ThemeData currentTheme) {
    bool isDark = currentTheme.scaffoldBackgroundColor == CustomTheme.darkBg;
    return isDark;
  }
}
