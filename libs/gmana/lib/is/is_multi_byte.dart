import 'package:gmana/regex/multi_byte_reg.dart';

/// check if the string contains one or more multi byte chars
bool isMultiByte(String str) {
  return multiByteReg.hasMatch(str);
}
