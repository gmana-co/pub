part of '../gmana.dart';

// Usage examples
final emailValidators = [
  Validators.required(message: 'Email is required'),
  Validators.email(message: 'Email is invalid'),
];

final passwordValidators = [
  Validators.required(message: 'Password is required'),
  Validators.minLength(8, message: 'Password must be at least 8 characters long'),
  Validators.pattern(
    r'(?=.*[A-Z])',
    message: 'Password must have at least one uppercase character',
  ),
  Validators.pattern(
    r'(?=.*?[#?!@$%^&*-])',
    message: 'Password must have at least one special character',
  ),
];

// Custom validator example
final usernameValidators = [
  Validators.required(message: 'Username is required'),
  Validators.minLength(3, message: 'Username must be at least 3 characters long'),
  Validators.maxLength(20, message: 'Username must not exceed 20 characters'),
  Validators.custom(
    (value) => value!.contains('@') ? '' : null,
    message: 'Username cannot contain @',
  ),
];

// Function to use the validators
String? validateEmail(String? value) => Validators.validate(value, emailValidators);

String? validatePassword(String? value) => Validators.validate(value, passwordValidators);

String? validateUsername(String? value) => Validators.validate(value, usernameValidators);
typedef ValidationFunction = String? Function(String?);

class ValidationRule {
  final ValidationFunction validate;
  final String errorMessage;

  const ValidationRule(this.validate, this.errorMessage);

  String? call(String? value) => validate(value) == null ? null : errorMessage;
}

class Validators {
  static ValidationRule custom(ValidationFunction func, {required String message}) {
    return ValidationRule(func, message);
  }

  static ValidationRule email({String message = 'Invalid email format'}) {
    return ValidationRule(
      (value) => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value ?? '') ? null : '',
      message,
    );
  }

  static ValidationRule maxLength(int length, {String? message}) {
    return ValidationRule(
      (value) => value != null && value.length <= length ? null : '',
      message ?? 'Must not exceed $length characters',
    );
  }

  static ValidationRule minLength(int length, {String? message}) {
    return ValidationRule(
      (value) => value != null && value.length >= length ? null : '',
      message ?? 'Must be at least $length characters long',
    );
  }

  static ValidationRule pattern(String pattern, {required String message}) {
    return ValidationRule(
      (value) => RegExp(pattern).hasMatch(value ?? '') ? null : '',
      message,
    );
  }

  static ValidationRule required({String message = 'This field is required'}) {
    return ValidationRule(
      (value) => value?.isNotEmpty == true ? null : '',
      message,
    );
  }

  static String? validate(String? value, List<ValidationRule> rules) {
    for (final rule in rules) {
      final error = rule(value);
      if (error != null) return error;
    }
    return null;
  }
}
