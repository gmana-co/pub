part of 'gmana_ext.dart';

extension ThemeModeExt on ThemeMode {
  IconData toThemeModeIcon() {
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

  String toThemeModeLabel() {
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

  String toThemeModeKey() {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.light:
        return 'Light Mode';
      default:
        return 'System Mode';
    }
  }
}

extension ThemeModeStringExt on String {
  ThemeMode toThemeMode() {
    switch (this) {
      case 'system':
        return ThemeMode.system;
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  IconData toThemeModeIcon() {
    switch (this) {
      case 'system':
        return Icons.brightness_6;
      case 'dark':
        return Icons.dark_mode;
      case 'light':
        return Icons.light_mode;
      default:
        return Icons.brightness_6;
    }
  }

  String toThemeModeLabel() {
    switch (this) {
      case 'system':
        return 'System Mode';
      case 'dark':
        return 'Dark Mode';
      case 'light':
        return 'Light Mode';
      default:
        return 'System Mode';
    }
  }
}
