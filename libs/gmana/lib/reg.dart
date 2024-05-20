part of 'gmana.dart';

RegExp alphanumericReg = RegExp(alphanumericRegStr);
String alphanumericRegStr = r'^[a-zA-Z0-9]+$';

RegExp alphaReg = RegExp(alphaRegStr);
String alphaRegStr = r'^[a-zA-Z]+$';

RegExp asciiReg = RegExp(asciiRegStr);
String asciiRegStr = r'^[\x00-\x7F]+$';

RegExp base64Reg = RegExp(base64RegStr);
String base64RegStr = r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$';

RegExp creditCardReg = RegExp(creditCardRegStr);
String creditCardRegStr = r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$';

RegExp emailReg = RegExp(emailRegStr);
String emailRegStr =
    r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

RegExp fiveDigit = RegExp(fiveDigitStr);
String fiveDigitStr = r'^\d{5}$';

RegExp floatReg = RegExp(floatRegStr);
String floatRegStr = r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$';

RegExp fourDigit = RegExp(fourDigitStr);
String fourDigitStr = r'^\d{4}$';

RegExp fullWidthReg = RegExp(fullWidthRegStr);
String fullWidthRegStr = r'[^\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]';

RegExp halfWidthReg = RegExp(halfWidthRegStr);
String halfWidthRegStr = r'[\u0020-\u007E\uFF61-\uFF9F\uFFA0-\uFFDC\uFFE8-\uFFEE0-9a-zA-Z]';

RegExp hexadecimalReg = RegExp(hexadecimalRegStr);
String hexadecimalRegStr = r'^[0-9a-fA-F]+$';

RegExp hexColorReg = RegExp(hexColorRegStr);
String hexColorRegStr = r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$';

RegExp intReg = RegExp(intRegStr);
String intRegStr = r'^(?:-?(?:0|[1-9][0-9]*))$';

RegExp ipv4Maybe = RegExp(ipv4MaybeStr);
String ipv4MaybeStr = r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$';

RegExp ipv6 = RegExp(ipv6Str);
String ipv6Str = r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$';

RegExp isbn10MaybeReg = RegExp(isbn10MaybeRegStr);
String isbn10MaybeRegStr = r'^(?:[0-9]{9}X|[0-9]{10})$';

RegExp isbn13MaybeReg = RegExp(isbn13MaybeRegStr);
String isbn13MaybeRegStr = r'^(?:[0-9]{13})$';

RegExp multiByteReg = RegExp(multiByteRegStr);
String multiByteRegStr = r'[^\x00-\x7F]';

RegExp numericReg = RegExp(numericRegStr);
String numericRegStr = r'^-?[0-9]+$';

Map<String, RegExp> postalCodePatterns = {
  'AD': RegExp(r'^AD\d{3}$'),
  'AT': fourDigit,
  'AU': fourDigit,
  'BE': fourDigit,
  'BG': fourDigit,
  'CA': RegExp(r'^[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][\s\-]?\d[ABCEGHJ-NPRSTV-Z]\d$', caseSensitive: false),
  'CH': fourDigit,
  'CZ': RegExp(r'^\d{3}\s?\d{2}$'),
  'DE': fiveDigit,
  'DK': fourDigit,
  'DZ': fiveDigit,
  'EE': fiveDigit,
  'ES': fiveDigit,
  'FI': fiveDigit,
  'FR': RegExp(r'^\d{2}\s?\d{3}$'),
  'GB': RegExp(r'^(gir\s?0aa|[a-z]{1,2}\d[\da-z]?\s?(\d[a-z]{2})?)$', caseSensitive: false),
  'GR': RegExp(r'^\d{3}\s?\d{2}$'),
  'HR': RegExp(r'^([1-5]\d{4}$)'),
  'HU': fourDigit,
  'ID': fiveDigit,
  'IL': fiveDigit,
  'IN': sixDigit,
  'IS': threeDigit,
  'IT': fiveDigit,
  'JP': RegExp(r'^\d{3}\-\d{4}$'),
  'KE': fiveDigit,
  'KM': fiveDigit,
  'LI': RegExp(r'^(948[5-9]|949[0-7])$'),
  'LT': RegExp(r'^LT\-\d{5}$'),
  'LU': fourDigit,
  'LV': RegExp(r'^LV\-\d{4}$'),
  'MX': fiveDigit,
  'NL': RegExp(r'^\d{4}\s?[a-z]{2}$', caseSensitive: false),
  'NO': fourDigit,
  'PL': RegExp(r'^\d{2}\-\d{3}$'),
  'PT': RegExp(r'^\d{4}\-\d{3}?$'),
  'RO': sixDigit,
  'RU': sixDigit,
  'SA': fiveDigit,
  'SE': RegExp(r'^\d{3}\s?\d{2}$'),
  'SI': fourDigit,
  'SK': RegExp(r'^\d{3}\s?\d{2}$'),
  'TN': fourDigit,
  'TW': RegExp(r'^\d{3}(\d{2})?$'),
  'UA': fiveDigit,
  'US': RegExp(r'^\d{5}(-\d{4})?$'),
  'ZA': fourDigit,
  'ZM': fiveDigit
};

RegExp sixDigit = RegExp(sixDigitStr);
String sixDigitStr = r'^\d{6}$';

RegExp surrogatePairsReg = RegExp(surrogatePairsRegStr);
String surrogatePairsRegStr = r'[\uD800-\uDBFF][\uDC00-\uDFFF]';

RegExp threeDigit = RegExp(threeDigitStr);
String threeDigitStr = r'^\d{3}$';

Map<String, RegExp> uuidReg = {
  '3': RegExp(r'^[0-9A-F]{8}-[0-9A-F]{4}-3[0-9A-F]{3}-[0-9A-F]{4}-[0-9A-F]{12}$'),
  '4': RegExp(r'^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$'),
  '5': RegExp(r'^[0-9A-F]{8}-[0-9A-F]{4}-5[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$'),
  'all': RegExp(r'^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$')
};
