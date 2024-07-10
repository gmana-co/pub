import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Push to a route with the given [Widget] and return generic Type T
  Future<T?> push<T>(Widget widget) {
    return Navigator.of(this).push<T>(
        MaterialPageRoute<T>(builder: (BuildContext context) => widget));
  }

  /// Push to a given route and clear the existing navigation stack
  Future<T?> pushAndRemoveUntil<T>(Widget widget) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute<T>(builder: (BuildContext context) => widget),
      (Route<dynamic> route) => false,
    );
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(
      message: message,
      backgroundColor: Colors.red,
      color: Colors.white,
    );
  }

  void showSnackBar({
    required String message,
    Color color = Colors.grey,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: color),
          ),
          backgroundColor: backgroundColor,
        ),
      );
  }
}
