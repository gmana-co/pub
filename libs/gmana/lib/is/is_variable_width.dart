import 'package:gmana/is/is_full_width.dart';
import 'package:gmana/is/is_half_width.dart';

/// check if the string contains a mixture of full and half-width chars
bool isVariableWidth(String str) {
  return isFullWidth(str) && isHalfWidth(str);
}
