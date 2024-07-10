import 'package:gmana/regex/surrogate_pairs_reg.dart';

/// check if the length of the string [str] falls in a range
bool isLength(String str, int min, [int? max]) {
  final List surrogatePairs = surrogatePairsReg.allMatches(str).toList();
  final len = str.length - surrogatePairs.length;
  return len >= min && (max == null || len <= max);
}
