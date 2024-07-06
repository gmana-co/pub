part of '../gmana.dart';

/// check if the string contains any full-width chars
bool isFullWidth(String str) {
  return fullWidthReg.hasMatch(str);
}
