import 'dart:async';

import 'package:flutter/widgets.dart' show VoidCallback;

/// Default debounce time (in milliseconds).
const kDefaultDebounceTime = 150;

/// {@template debounce}
/// A simple class to debounce function execution.
/// {@endtemplate}
/// ```dart
/// final Debounce _debounce = Debounce(milliseconds: 300);
/// final TextEditingController _controller = TextEditingController();
///
/// @override
/// void dispose() {
///   _debounce.dispose();
///   _controller.dispose();
///   super.dispose();
/// }
///
/// TextField(
///   controller: _controller,
///   decoration: InputDecoration(
///     labelText: 'Search',
///   ),
///   onChanged: (value) {
///     _debounce.run(_onSearchChanged);
///   },
/// ),
/// ```
class Debounce {
  /// The delay in milliseconds.
  final int milliseconds;

  Timer? _timer;

  /// {@macro debounce}
  Debounce({this.milliseconds = kDefaultDebounceTime});

  /// Disposes the timer if it is active.
  void dispose() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }

  /// Runs the [action] after the specified [milliseconds] delay.
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

/// Applies debouncing to a function.
extension DebounceFunction on void Function() {
  /// Function debounce with a certain delay.
  void debounce({int milliseconds = kDefaultDebounceTime}) {
    final debounce = Debounce(milliseconds: milliseconds);
    debounce.run(call);
  }
}
