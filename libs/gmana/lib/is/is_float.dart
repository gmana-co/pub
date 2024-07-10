import 'package:gmana/regex/float_reg.dart';

/// check if the string [str] is a float
bool isFloat(String str) {
  return floatReg.hasMatch(str);
}
