import 'package:flutter/material.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeChangeNotifierProvider<ThemeModeState> themeProvider = ChangeNotifierProvider.autoDispose((AutoDisposeChangeNotifierProviderRef<ThemeModeState> ref) {
  return ThemeModeState();
});

class ThemeModeState extends ChangeNotifier {
  ThemeModeState() {
    final String mode = Hive.box(GConfig.settingsStorageKey).get('themeMode', defaultValue: ThemeMode.system.toString()) as String;
    switch (mode) {
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
        break;
      case 'ThemeMode.light':
        themeMode = ThemeMode.light;
        break;
      case 'ThemeMode.system':
        themeMode = ThemeMode.system;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }
  }

  late ThemeMode themeMode;

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    Hive.box(GConfig.settingsStorageKey).put('themeMode', themeMode.toString());
    notifyListeners();
  }
}
