import 'package:gmana/is/is_hexadecimal.dart';

/// check if the string is a valid hex-encoded representation of a MongoDB ObjectId
bool isMongoId(String str) {
  return isHexadecimal(str) && str.length == 24;
}
