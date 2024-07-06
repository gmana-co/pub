part of '../gmana.dart';

/// check if the string [str] is an email
bool isEmail(String str) {
  return emailReg.hasMatch(str.toLowerCase());
}
