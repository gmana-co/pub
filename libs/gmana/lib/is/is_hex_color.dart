import 'package:gmana/regex/hex_color_reg.dart';

/// check if the string [str] is a hexadecimal color
bool isHexColor(String str) {
  return hexColorReg.hasMatch(str);
}
