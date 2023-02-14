import 'package:flutter/material.dart';

class GTheme {
  static ThemeData get light {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF228B22)),
      useMaterial3: true,
      // scaffoldBackgroundColor: Colors.grey.shade50,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        isDense: true,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
      ),
      // colorScheme: ColorScheme.fromSwatch(
      //   accentColor: const Color(0xFF228B22),
      // ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(tileColor: Colors.white),
      dividerTheme: DividerThemeData(color: Colors.grey.shade100),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.grey.shade800,
            foregroundColor: Colors.grey.shade100),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          isDense: true,
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF424242),
        ),
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          accentColor: const Color(0xFF616161),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
        dividerTheme: DividerThemeData(color: Colors.grey.shade700),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white));
  }
}

// @immutable
// class GManaTheme extends ThemeExtension<GManaTheme> {
//   const GManaTheme({
//     this.primaryColor = const Color(0xFF228B22),
//     this.neutralColor = const Color(0xFF424242),
//     this.tertiaryColor = const Color(0xFF616161),
//   });

//   final Color primaryColor;
//   final Color tertiaryColor;
//   final Color neutralColor;

//   ThemeData totThemeData() {
//     return ThemeData(useMaterial3: true);
//   }

//   // ThemeData _base() {
//   //   final primaryTextTheme = GoogleFonts.lektonTextTheme();
//   //   final secondaryTextTheme = GoogleFonts.montserratTextTheme();
//   //   final textTheme = primaryTextTheme.copyWith(displaySmall: secondaryTextTheme.displaySmall);

//   //   return ThemeData( textTheme: textTheme);
//   // }

//   Scheme _scheme() {
//     final base = CorePalette.of(primaryColor.value);
//     final primary = base.primary;
//     final tertiary = CorePalette.of(tertiaryColor.value).primary;
//     final neutral = CorePalette.of(neutralColor.value).neutral;

//     return Scheme(
//       primary: primary.get(40),
//       onPrimary: primary.get(100),
//       primaryContainer: primary.get(90),
//       onPrimaryContainer: primary.get(10),
//       secondary: base.secondary.get(40),
//       onSecondary: base.secondary.get(100),
//       secondaryContainer: base.secondary.get(90),
//       onSecondaryContainer: base.secondary.get(10),
//       tertiary: tertiary.get(40),
//       onTertiary: tertiary.get(100),
//       tertiaryContainer: tertiary.get(90),
//       onTertiaryContainer: tertiary.get(10),
//       error: base.error.get(40),
//       onError: base.error.get(100),
//       errorContainer: base.error.get(90),
//       onErrorContainer: base.error.get(10),
//       background: neutral.get(99),
//       onBackground: neutral.get(10),
//       surface: neutral.get(99),
//       onSurface: neutral.get(10),
//       surfaceVariant: base.neutralVariant.get(80),
//       onSurfaceVariant: base.neutralVariant.get(30),
//       outline: base.neutralVariant.get(50),
//       outlineVariant: base.neutralVariant.get(90),
//       shadow: neutral.get(0),
//       scrim: neutral.get(0),
//       inverseSurface: neutral.get(20),
//       inverseOnSurface: neutral.get(95),
//       inversePrimary: primary.get(80),
//     );
//   }

//   @override
//   ThemeExtension<GManaTheme> copyWith({Color? primaryColor, Color? neutralColor, Color? tertiaryColor}) {
//     return GManaTheme(
//       primaryColor: primaryColor ?? this.primaryColor,
//       neutralColor: neutralColor ?? this.neutralColor,
//       tertiaryColor: tertiaryColor ?? this.tertiaryColor,
//     );
//   }

//   @override
//   ThemeExtension<GManaTheme> lerp(covariant ThemeExtension<GManaTheme>? other, double t) {
//     if (other is! GManaTheme) return this;
//     return GManaTheme(
//       primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
//       neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
//       tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
//     );
//   }
// }
