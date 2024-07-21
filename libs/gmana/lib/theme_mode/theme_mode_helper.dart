import 'package:flutter/material.dart';

import 'theme_mode.dart';

/// ```dart
/// // Using ThemeMode as input
/// final themeMode = ThemeMode.dark;
/// ThemeMode mode = ThemeModeHelper.getThemeMode(themeMode);
/// IconData icon = ThemeModeHelper.getThemeModeIcon(themeMode);
/// String label = ThemeModeHelper.getThemeModeLabel(themeMode);
/// // Using String as input
/// final themeModeString = 'dark';
/// ThemeMode modeFromString = ThemeModeHelper.getThemeMode(themeModeString);
/// IconData iconFromString = ThemeModeHelper.getThemeModeIcon(themeModeString);
/// String labelFromString = ThemeModeHelper.getThemeModeLabel(themeModeString);
///
/// // Using custom values
/// final customIcons = {ThemeModeOption.dark: Icons.nightlight_round};
/// final customLabels = {ThemeModeOption.dark: 'Night Mode'};
///
/// IconData customIcon = ThemeModeHelper.getThemeModeIcon(themeMode, customIcons: customIcons);
/// String customLabel = ThemeModeHelper.getThemeModeLabel(themeMode, customLabels: customLabels);
/// ```
class ThemeModeHelper {
  static ThemeMode getThemeMode(dynamic input,
      {Map<ThemeModeOption, ThemeMode>? customThemeModes}) {
    final option = ThemeModeConverter.fromDynamic(input);
    return customThemeModes?[option] ??
        ThemeModeConstants.defaultData[option]!.themeMode;
  }

  static IconData getThemeModeIcon(dynamic input,
      {Map<ThemeModeOption, IconData>? customIcons}) {
    final option = ThemeModeConverter.fromDynamic(input);
    return customIcons?[option] ?? ThemeModeConstants.defaultData[option]!.icon;
  }

  static String getThemeModeLabel(dynamic input,
      {Map<ThemeModeOption, String>? customLabels}) {
    final option = ThemeModeConverter.fromDynamic(input);
    return customLabels?[option] ??
        ThemeModeConstants.defaultData[option]!.label;
  }
}
