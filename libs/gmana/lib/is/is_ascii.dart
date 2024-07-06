part of '../gmana.dart';

/// check if the string contains ASCII chars only
bool isAscii(String str) {
  return asciiReg.hasMatch(str);
}
