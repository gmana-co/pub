import 'validation_rule.dart';

class Validators {
  static const _emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  static ValidationRule custom(ValidationFunction func, {required String message}) {
    return ValidationRule(func, message);
  }

  static ValidationRule email({String message = 'Invalid email format'}) {
    return ValidationRule(
      (value) => RegExp(_emailRegex).hasMatch(value ?? '') ? null : '',
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

  static ValidationRule oneLowerCase({String message = 'Must contain at least one lowercase letter'}) {
    return ValidationRule(
      (value) => RegExp(r'[a-z]').hasMatch(value ?? '') ? null : '',
      message,
    );
  }

  static ValidationRule oneNumber({String message = 'Must contain at least one number'}) {
    return ValidationRule(
      (value) => RegExp(r'[0-9]').hasMatch(value ?? '') ? null : '',
      message,
    );
  }

  static ValidationRule oneSpecial({String message = 'Must contain at least one special character'}) {
    return ValidationRule(
      (value) => RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value ?? '') ? null : '',
      message,
    );
  }

  static ValidationRule oneUpperCase({String message = 'Must contain at least one uppercase letter'}) {
    return ValidationRule(
      (value) => RegExp(r'[A-Z]').hasMatch(value ?? '') ? null : '',
      message,
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
