import 'package:gmana/regex/numeric_reg.dart';

/// check if the string [str] contains only numbers
bool isNumeric(String str) {
  return numericReg.hasMatch(str);
}
