part of 'helpers.dart';

bool contains(String str, String seed) {
  return str.contains(seed.toString());
}

bool equals(String? str, String comparison) {
  return str == comparison.toString();
}

/// check if the string is a date that's after the specified date
///
/// If `date` is not passed, it defaults to now.
bool isAfter(String? str, [String? date]) {
  DateTime d;
  if (date == null) {
    d = DateTime.now();
  } else if (isDate(date)) {
    d = DateTime.parse(date);
  } else {
    return false;
  }

  DateTime strDate;
  try {
    strDate = DateTime.parse(str!);
  } catch (e) {
    return false;
  }

  return strDate.isAfter(d);
}

/// check if the string [str] contains only letters (a-zA-Z).
bool isAlpha(String str) {
  return alphaReg.hasMatch(str);
}

/// check if the string [str] contains only letters and numbers
bool isAlphanumeric(String str) {
  return alphanumericReg.hasMatch(str);
}

/// check if the string contains ASCII chars only
bool isAscii(String str) {
  return asciiReg.hasMatch(str);
}

/// check if a string [str] is base64 encoded
bool isBase64(String str) {
  return base64Reg.hasMatch(str);
}

/// check if the string is a date that's before the specified date
///
/// If `date` is not passed, it defaults to now.
bool isBefore(String? str, [String? date]) {
  DateTime d;
  if (date == null) {
    d = DateTime.now();
  } else if (isDate(date)) {
    d = DateTime.parse(date);
  } else {
    return false;
  }

  DateTime strDate;
  try {
    strDate = DateTime.parse(str!);
  } catch (e) {
    return false;
  }

  return strDate.isBefore(d);
}

/// check if the string's length (in bytes) falls in a range.
bool isByteLength(String str, int min, [int? max]) {
  return str.length >= min && (max == null || str.length <= max);
}

bool isCreditCard(String str) {
  final sanitized = str.replaceAll(RegExp('[^0-9]+'), '');
  if (!creditCardReg.hasMatch(sanitized)) {
    return false;
  }

  var sum = 0;
  String digit;
  var shouldDouble = false;

  for (var i = sanitized.length - 1; i >= 0; i--) {
    digit = sanitized.substring(i, i + 1);
    var tmpNum = int.parse(digit);

    if (shouldDouble == true) {
      tmpNum *= 2;
      if (tmpNum >= 10) {
        sum += (tmpNum % 10) + 1;
      } else {
        sum += tmpNum;
      }
    } else {
      sum += tmpNum;
    }
    shouldDouble = !shouldDouble;
  }

  return sum % 10 == 0;
}

/// check if the string is a date
bool isDate(String str) {
  try {
    DateTime.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}

/// check if the string [str] is a number that's divisible by another
///
/// [n] is a String or an int.
bool isDivisibleBy(String str, String n) {
  try {
    return double.parse(str) % int.parse(n) == 0;
  } catch (e) {
    return false;
  }
}

/// check if the string [str] is an email
bool isEmail(String str) {
  return emailReg.hasMatch(str.toLowerCase());
}

/// check if the string [str] is a float
bool isFloat(String str) {
  return floatReg.hasMatch(str);
}

bool isFQDN(String str, {bool requireTld = true, bool allowUnderscores = false}) {
  final parts = str.split('.');
  if (requireTld) {
    final tld = parts.removeLast();
    if (parts.isEmpty || !RegExp(r'^[a-z]{2,}$').hasMatch(tld)) {
      return false;
    }
  }

  for (final part in parts) {
    if (allowUnderscores) {
      if (part.contains('__')) {
        return false;
      }
    }
    if (!RegExp(r'^[a-z\\u00a1-\\uffff0-9-]+$').hasMatch(part)) {
      return false;
    }
    if (part[0] == '-' || part[part.length - 1] == '-' || part.contains('---')) {
      return false;
    }
  }
  return true;
}

/// check if the string contains any full-width chars
bool isFullWidth(String str) {
  return fullWidthReg.hasMatch(str);
}

/// check if the string contains any half-width chars
bool isHalfWidth(String str) {
  return halfWidthReg.hasMatch(str);
}

/// check if the string  [str]is a hexadecimal number
bool isHexadecimal(String str) {
  return hexadecimalReg.hasMatch(str);
}

/// check if the string [str] is a hexadecimal color
bool isHexColor(String str) {
  return hexColorReg.hasMatch(str);
}

/// check if the string [str] is an integer
bool isInt(String str) {
  return intReg.hasMatch(str);
}

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

/// check if the string is valid JSON
bool isJSON(String str) {
  try {
    jsonDecode(str);
  } catch (e) {
    return false;
  }
  return true;
}

/// check if the length of the string [str] falls in a range
bool isLength(String str, int min, [int? max]) {
  final List surrogatePairs = surrogatePairsReg.allMatches(str).toList();
  final len = str.length - surrogatePairs.length;
  return len >= min && (max == null || len <= max);
}

/// check if the string [str] is lowercase
bool isLowercase(String str) {
  return str == str.toLowerCase();
}

/// check if the string is a valid hex-encoded representation of a MongoDB ObjectId
bool isMongoId(String str) {
  return isHexadecimal(str) && str.length == 24;
}

/// check if the string contains one or more multi byte chars
bool isMultiByte(String str) {
  return multiByteReg.hasMatch(str);
}

/// check if the string [str] is null
bool isNull(String? str) {
  return str == null || str.isEmpty;
}

/// check if the string [str] contains only numbers
bool isNumeric(String str) {
  return numericReg.hasMatch(str);
}

bool isPostalCode(String? text, String locale, {bool Function()? orElse}) {
  final pattern = postalCodePatterns[locale];
  return pattern != null
      ? pattern.hasMatch(text!)
      : orElse != null
          ? orElse()
          : throw const FormatException();
}

/// check if the string contains any surrogate pairs chars
bool isSurrogatePair(String str) {
  return surrogatePairsReg.hasMatch(str);
}

/// check if the string [str] is uppercase
bool isUppercase(String str) {
  return str == str.toUpperCase();
}

/// check if the string is a UUID (version 3, 4 or 5).
bool isUUID(String? str, [String? version]) {
  if (version == null) {
    version = 'all';
  } else {
    version = version.toString();
  }

  final pat = uuidReg[version];
  return pat != null && pat.hasMatch(str!.toUpperCase());
}

/// check if the string contains a mixture of full and half-width chars
bool isVariableWidth(String str) {
  return isFullWidth(str) && isHalfWidth(str);
}

/// check if string [str] matches the [pattern].
bool matches(String str, String pattern) {
  final re = RegExp(pattern);
  return re.hasMatch(str);
}
