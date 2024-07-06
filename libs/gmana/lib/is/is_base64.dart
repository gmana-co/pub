part of '../gmana.dart';

/// check if a string [str] is base64 encoded
bool isBase64(String str) {
  return base64Reg.hasMatch(str);
}
