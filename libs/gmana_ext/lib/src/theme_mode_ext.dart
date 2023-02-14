import 'package:flutter/material.dart';

extension ThemeModeExt on ThemeMode {
  IconData toIcon() {
    switch (this) {
      case ThemeMode.system:
        return Icons.brightness_6;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.light:
        return Icons.light_mode;
      default:
        return Icons.brightness_6;
    }
  }

  String toLabel() {
    switch (this) {
      case ThemeMode.system:
        return 'System Mode';
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.light:
        return 'Light Mode';
      default:
        return 'System Mode';
    }
  }
}
