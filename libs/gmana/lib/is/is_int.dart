part of '../gmana.dart';

/// check if the string [str] is an integer
bool isInt(String str) {
  return intReg.hasMatch(str);
}
