import 'package:gmana/regex/full_width_reg.dart';

/// check if the string contains any full-width chars
bool isFullWidth(String str) {
  return fullWidthReg.hasMatch(str);
}
