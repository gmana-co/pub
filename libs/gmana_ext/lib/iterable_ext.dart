extension IterableX<T extends num> on Iterable<T> {
  /// Extension method for Iterable<num>
  /// ```dart
  /// int sumInt = [1, 2, 3].sum();
  /// print(sumInt);
  ///
  /// double sumDouble = [1.0, 2.0, 3.0].sum();
  /// print(sumDouble);
  /// ```
  T sum() => reduce((value, element) => (value + element) as T);
}
