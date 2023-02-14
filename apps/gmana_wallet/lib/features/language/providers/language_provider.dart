import 'package:flutter/material.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeChangeNotifierProvider<LanguageState> languageProvider =
    ChangeNotifierProvider.autoDispose(
        (AutoDisposeChangeNotifierProviderRef<LanguageState> ref) {
  return LanguageState();
});

class LanguageState extends ChangeNotifier {
  static const String _languageKey = 'language_key';

  LanguageState() {
    language = Hive.box(GConfig.settingsStorageKey)
        .get(_languageKey, defaultValue: 'en') as String;
  }

  late String language;

  void setLanguage(String lang) {
    language = lang;
    Hive.box(GConfig.settingsStorageKey).put(_languageKey, lang);
    notifyListeners();
  }
}
