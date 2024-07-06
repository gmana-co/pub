part of '../gmana.dart';

/// check if the string [str] is a hexadecimal color
bool isHexColor(String str) {
  return hexColorReg.hasMatch(str);
}
