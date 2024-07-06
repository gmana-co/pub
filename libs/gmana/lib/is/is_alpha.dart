part of '../gmana.dart';

/// check if the string [str] contains only letters (a-zA-Z).
bool isAlpha(String str) {
  return alphaReg.hasMatch(str);
}
