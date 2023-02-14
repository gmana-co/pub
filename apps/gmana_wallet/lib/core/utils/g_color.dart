import 'package:flutter/material.dart';

class GColors {
  static const Color primaryColor = Color(0xFF228B22);
  static const Color primaryBackground = Color(0xFF263238);
  static const Color primaryDark = Color(0xFF000A12);
  static const Color primaryLight = Color(0xFF4F5B62);
  static const Color secondaryBackground = Color(0xFF37474f);
  static const Color secondaryDark = Color(0xFF102027);
  static const Color secondaryLight = Color(0xFF62727b);
  static const Color textColor = Colors.white;
  static const Color textColor2 = Color(0xFFefebe9);
  static const Color selectedPrimary = Color(0xFF5c6abc);

  static const List<Color> accentColors = [
    Color(0xFF8bc34a), // 0
    Color(0xFFffb300), // 1
    Color(0xFFf4511e), // 2
    Color(0xFFab47bc), // 3
    Color(0xFF42a5f5), // 4
    Color(0xFF26c6da), // 5
    Color(0xFF66bb6a), // 6
    Color(0xff7c8900), // 7
    Color(0xffffe400), // 8
    Color(0xFFec407a), // 9
    Color(0xFFeb0c0c), // 10
  ];

  static const List<Color> darkAccentColors = [
    Color(0xff425f1f), // Chromatic-0:1
    Color(0xff7f5900), // Chromatic-1:1
    Color(0xFF792105), // Chromatic-2:1
    Color(0xFF54225d), // Chromatic-3:1
    Color(0xFF064579), // Chromatic-4:1
    Color(0xFF12626c), // Chromatic-5:1
    Color(0xFF275829), // Chromatic-6:1
    Color(0xFF737f00), // Chromatic-7:1
    Color(0xFF7f7100), // Chromatic-8:1
    Color(0xFF730b2e), // Chromatic-9:1
    Color(0xFF5d0000), // Chromatic-10:1
  ];

  static const List<Color> lightAccentColors = [
    Color(0xff84bf3f), // Chromatic-0:2
    Color(0xFFffb300), // Chromatic-1:2
    Color(0xFFf3420b), // Chromatic-2:2
    Color(0xFFa944ba), // Chromatic-3:2
    Color(0xFF0c8bf2), // Chromatic-4:2
    Color(0xFF25c5d9), // Chromatic-5:2
    Color(0xFF4eb053), // Chromatic-6:2
    Color(0xFFe6ff00), // Chromatic-7:2
    Color(0xFFffe300), // Chromatic-8:2
    Color(0xFFe7175d), // Chromatic-9:2
    Color(0xFFc30000), // Chromatic-10:2
  ];

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
