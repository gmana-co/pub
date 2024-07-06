part of '../gmana.dart';

/// check if the string contains a mixture of full and half-width chars
bool isVariableWidth(String str) {
  return isFullWidth(str) && isHalfWidth(str);
}
