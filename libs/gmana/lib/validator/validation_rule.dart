import 'package:flutter/foundation.dart';

typedef ValidationFunction = String? Function(String?);

@immutable
class ValidationRule {
  final ValidationFunction validate;
  final String errorMessage;

  const ValidationRule(this.validate, this.errorMessage);

  String? call(String? value) => validate(value) == null ? null : errorMessage;
}
