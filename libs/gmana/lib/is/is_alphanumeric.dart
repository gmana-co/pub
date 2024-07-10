import 'package:gmana/regex/alphanumeric_reg.dart';

/// check if the string [str] contains only letters and numbers
bool isAlphanumeric(String str) {
  return alphanumericReg.hasMatch(str);
}
