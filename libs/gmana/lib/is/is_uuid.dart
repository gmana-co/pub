part of '../gmana.dart';

/// check if the string is a UUID (version 3, 4 or 5).
bool isUuid(String? str, [String? version]) {
  if (version == null) {
    version = 'all';
  } else {
    version = version.toString();
  }

  final pat = uuidReg[version];
  return pat != null && pat.hasMatch(str!.toUpperCase());
}
