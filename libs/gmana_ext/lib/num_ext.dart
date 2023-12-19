part of 'gmana_ext.dart';

extension Normalize on num {
  /// ```dart
  /// print(260.normalized(0.0, 300).toDouble());
  /// // result: 0.8666666666666667
  /// ```
  num normalized(
    num selfRangeMin,
    num selfRangeMax, [
    num normalizedRangeMin = 0.0,
    num normalizedRangeMax = 1.0,
  ]) {
    return (normalizedRangeMax - normalizedRangeMin) * ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) + normalizedRangeMin;
  }
}
