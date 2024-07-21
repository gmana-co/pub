import 'dart:ui';

/// ```dart
/// final locale1 = Locale('en', 'US');
/// print(fromLocale(locale1));  // Outputs: en_US
///
/// final locale2 = Locale('zh', 'CN', 'Hans');
/// print(fromLocale(locale2));  // Outputs: zh_Hans_CN
///
/// final locale3 = Locale('ja');
/// print(fromLocale(locale3));  // Outputs: ja
/// ```
String fromLocale(Locale locale) {
  final languageCode = locale.languageCode;
  final countryCode = locale.countryCode;
  final scriptCode = locale.scriptCode;

  if (scriptCode != null) {
    return countryCode != null
        ? '${languageCode}_${scriptCode}_$countryCode'
        : '${languageCode}_$scriptCode';
  } else if (countryCode != null && countryCode.isNotEmpty) {
    return '${languageCode}_$countryCode';
  } else {
    return languageCode;
  }
}

Locale toLocale(String? locale) {
  const defaultLocale = Locale('en', 'US');

  if (locale == null || locale.isEmpty) {
    return defaultLocale;
  }

  try {
    final parts = locale.split('_');
    switch (parts.length) {
      case 1:
        return Locale(parts[0]);
      case 2:
        return Locale(parts[0], parts[1]);
      default:
        return Locale.fromSubtags(
          languageCode: parts[0],
          countryCode: parts.length > 1 ? parts[1] : null,
          scriptCode: parts.length > 2 ? parts[2] : null,
        );
    }
  } catch (e) {
    return defaultLocale;
  }
}
