import 'dart:math';

class Gid {
  final Random _random = Random();

  String v1() {
    final special = 8 + _random.nextInt(4);

    return '${_bits(16, 4)}${_bits(16, 4)}-${_bits(16, 4)}-4${_bits(12, 3)}-${_printDigits(special, 1)}${_bits(12, 3)}-${_bits(16, 4)}${_bits(16, 4)}${_bits(16, 4)}';
  }

  String v2() {
    final special = 8 + _random.nextInt(4);

    return 'G${DateTime.now().millisecondsSinceEpoch}-${_printDigits(special, 1)}${_bits(12, 3)}-${_bits(12, 4)}';
  }

  String v3(int length) {
    const ch = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    final r = Random();
    return String.fromCharCodes(Iterable.generate(length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
  }

  String v4({int length = 8, bool hasNumbers = true, bool hasSymbols = true}) {
    final r = Random();

    const alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = r'!@#$%^&*_-+=';

    var chars = alpha;
    if (hasNumbers) chars += numbers;
    if (hasSymbols) chars += symbols;

    return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(r.nextInt(chars.length))));
  }

  String _bits(int bitCount, int digitCount) => _printDigits(_generateBits(bitCount), digitCount);
  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);
  String _printDigits(int value, int count) => value.toRadixString(16).padLeft(count, '0');
}
