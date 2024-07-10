import 'package:gmana/regex/hexadecimal_reg.dart';

/// check if the string  [str]is a hexadecimal number
bool isHexadecimal(String str) {
  return hexadecimalReg.hasMatch(str);
}
