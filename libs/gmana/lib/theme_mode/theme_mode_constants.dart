import 'package:flutter/material.dart';

import 'theme_mode.dart';

class ThemeModeConstants {
  static const Map<ThemeModeOption, ThemeModeData> defaultData = {
    ThemeModeOption.system: ThemeModeData(
        themeMode: ThemeMode.system,
        icon: Icons.brightness_6,
        label: 'System Mode'),
    ThemeModeOption.dark: ThemeModeData(
        themeMode: ThemeMode.dark, icon: Icons.dark_mode, label: 'Dark Mode'),
    ThemeModeOption.light: ThemeModeData(
        themeMode: ThemeMode.light,
        icon: Icons.light_mode,
        label: 'Light Mode'),
  };
}
