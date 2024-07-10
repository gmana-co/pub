extension CompactMap<T> on Iterable<T?> {
  /// ```dart
  /// [1, 2, null, 3].compactMap();
  /// // result: (1, 2, 3)
  /// ```
  Iterable<T> compactMap<E>([E? Function(T?)? transform]) =>
      map(transform ?? (e) => e).where((e) => e != null).cast();
}

extension ListFlattenExtension<E> on List<List<E>> {
  /// ```dart
  /// print([[1, 2, 3],[4, 5, 6]].flatten());
  /// // result: [1, 2, 3, 4, 5, 6]
  /// ```
  List<E> flatten() => [for (final list in this) ...list];
}
