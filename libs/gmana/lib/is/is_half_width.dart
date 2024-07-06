part of '../gmana.dart';

/// check if the string contains any half-width chars
bool isHalfWidth(String str) {
  return halfWidthReg.hasMatch(str);
}
