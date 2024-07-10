import 'package:gmana/regex/int_reg.dart';

/// check if the string [str] is an integer
bool isInt(String str) {
  return intReg.hasMatch(str);
}
