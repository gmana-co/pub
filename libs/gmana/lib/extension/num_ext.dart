part of '../gmana.dart';

extension IntNullableExt on int? {
  int orZero() {
    return this ?? 0;
  }
}

extension Normalize on num {
  /// Convert Celsius to Fahrenheit
  /// ```dart
  /// print(25.celsiusToFahrenheit());
  /// ```
  double celsiusToFahrenheit() {
    return this * 9 / 5 + 32;
  }

  /// Convert Fahrenheit to Celsius
  /// ```dart
  /// print(77.fahrenheitToCelsius());
  /// ```
  double fahrenheitToCelsius() {
    return (this - 32) * 5 / 9;
  }

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
