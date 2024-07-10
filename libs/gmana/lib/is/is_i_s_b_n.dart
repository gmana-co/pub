import 'package:gmana/regex/isbn10_maybe_reg.dart';
import 'package:gmana/regex/isbn13_maybe_reg.dart';

/// check if the string is an ISBN (version 10 or 13)
bool isISBN(String? str, [String? version]) {
  if (version == null) {
    return isISBN(str, '10') || isISBN(str, '13');
  }

  version = version.toString();

  final sanitized = str!.replaceAll(RegExp(r'[\s-]+'), '');
  var checksum = 0;

  if (version == '10') {
    if (!isbn10MaybeReg.hasMatch(sanitized)) {
      return false;
    }
    for (var i = 0; i < 9; i++) {
      checksum += (i + 1) * int.parse(sanitized[i]);
    }
    if (sanitized[9] == 'X') {
      checksum += 10 * 10;
    } else {
      checksum += 10 * int.parse(sanitized[9]);
    }
    return checksum % 11 == 0;
  } else if (version == '13') {
    if (!isbn13MaybeReg.hasMatch(sanitized)) {
      return false;
    }
    final factor = [1, 3];
    for (var i = 0; i < 12; i++) {
      checksum += factor[i % 2] * int.parse(sanitized[i]);
    }
    return int.parse(sanitized[12]) - ((10 - (checksum % 10)) % 10) == 0;
  }

  return false;
}
