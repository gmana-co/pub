import 'package:gmana/regex/alpha_reg.dart';

/// check if the string [str] contains only letters (a-zA-Z).
bool isAlpha(String str) {
  return alphaReg.hasMatch(str);
}
