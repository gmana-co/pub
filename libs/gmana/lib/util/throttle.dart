import 'dart:async';

import 'package:flutter/widgets.dart' show VoidCallback;

/// Default duration of throttler.
const kDefaultThrottlerDuration = 300;

/// {@template throttler}
/// A simple class for throttling function execution.
/// {@endtemplate}
/// ```dart
/// class _MyHomePageState extends State<MyHomePage> {
///   final Throttle _throttler = Throttle(milliseconds: 300);
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(
///         title: Text('Flutter Throttle Example'),
///       ),
///       body: Center(
///         child: ElevatedButton(
///           onPressed: () {
///             _throttler.run(_onButtonPressed);
///           },
///           child: Text('Press me'),
///         ),
///       ),
///     );
///   }
///
///   @override
///   void dispose() {
///     _throttler.dispose();
///     super.dispose();
///   }
///
///   void _onButtonPressed() {
///     print("Button pressed!");
///   }
/// }
/// ```
class Throttle {
  /// The delay in milliseconds.
  final int milliseconds;

  Timer? _timer;

  /// {@macro throttler}
  Throttle({this.milliseconds = kDefaultThrottlerDuration});

  /// Disposes the timer if it is active.
  void dispose() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }

  /// Runs the [action] after [milliseconds] delay.
  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) return;

    action();
    _timer = Timer(Duration(milliseconds: milliseconds), () {});
  }
}

/// Applies throttling to a function.
extension ThrottleFunction on void Function() {
  /// Throttles the function with a certain delay.
  void throttle({int milliseconds = kDefaultThrottlerDuration}) {
    final throttler = Throttle(milliseconds: milliseconds);
    throttler.run(call);
  }
}
