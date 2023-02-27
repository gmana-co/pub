// import 'package:intl/intl.dart' show NumberFormat;

// extension NumsExtension<T extends num> on T {
//   T min(T minValue) => this < minValue ? minValue : this;
//   T max(T maxValue) => this > maxValue ? maxValue : this;

//   /// ```dart
//   /// print(123455556.9087.format)
//   /// ```
//   String get format => NumberFormat.decimalPattern().format(this);
// }

extension Normalize on num {
  /// ```dart
  /// print(260.normalized(0.0, 300).toDouble());
  /// // result: 0.8666666666666667
  /// ```
  num normalized(num selfRangeMin, num selfRangeMax, [num normalizedRangeMin = 0.0, num normalizedRangeMax = 1.0]) {
    return (normalizedRangeMax - normalizedRangeMin) * ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) + normalizedRangeMin;
  }
}
