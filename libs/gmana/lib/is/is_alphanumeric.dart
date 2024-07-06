part of '../gmana.dart';

/// check if the string [str] contains only letters and numbers
bool isAlphanumeric(String str) {
  return alphanumericReg.hasMatch(str);
}
