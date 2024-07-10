import 'package:gmana/regex/postal_code_patterns.dart';

bool isPostalCode(String? text, String locale, {bool Function()? orElse}) {
  final pattern = postalCodePatterns[locale];
  return pattern != null
      ? pattern.hasMatch(text!)
      : orElse != null
          ? orElse()
          : throw const FormatException();
}
