import 'package:flutter/material.dart';

import 'theme_mode.dart';

class ThemeModeConverter {
  static ThemeModeOption fromDynamic(dynamic input) {
    if (input is ThemeMode) {
      return fromThemeMode(input);
    } else if (input is String) {
      return fromString(input);
    } else {
      return ThemeModeOption.system;
    }
  }

  static ThemeModeOption fromString(String themeModeString) {
    switch (themeModeString.toLowerCase()) {
      case 'system':
        return ThemeModeOption.system;
      case 'dark':
        return ThemeModeOption.dark;
      case 'light':
        return ThemeModeOption.light;
      default:
        return ThemeModeOption.system;
    }
  }

  static ThemeModeOption fromThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return ThemeModeOption.system;
      case ThemeMode.dark:
        return ThemeModeOption.dark;
      case ThemeMode.light:
        return ThemeModeOption.light;
    }
  }
}
