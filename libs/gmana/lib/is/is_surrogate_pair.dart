import 'package:gmana/regex/surrogate_pairs_reg.dart';

/// check if the string contains any surrogate pairs chars
bool isSurrogatePair(String str) {
  return surrogatePairsReg.hasMatch(str);
}
