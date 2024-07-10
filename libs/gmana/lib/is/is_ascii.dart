import 'package:gmana/regex/ascii_reg.dart';

/// check if the string contains ASCII chars only
bool isAscii(String str) {
  return asciiReg.hasMatch(str);
}
