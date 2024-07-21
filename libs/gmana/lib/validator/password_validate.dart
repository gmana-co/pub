import 'validation_rule.dart';
import 'validators.dart';

/// Basic usage with default settings (only min length of 8)
/// ```dart
/// String? result1 = validatePassword('password123');
/// ```
/// Require uppercase and special character
/// ```dart
/// String? result2 = validatePassword(
///   'password123',
///   requirements: {
///     PasswordRequirement.minLength,
///     PasswordRequirement.upperCase,
///     PasswordRequirement.special,
///   },
/// );
/// ```
/// Custom min length and require digit
/// ```dart
/// String? result3 = validatePassword(
///   'pass123',
///   minLength: 6,
///   requirements: {
///     PasswordRequirement.minLength,
///     PasswordRequirement.digit,
///   },
/// );
/// ```
/// All requirements with custom special characters
/// ```dart
/// String? result4 = validatePassword(
///   'Password123!',
///   requirements: PasswordRequirement.values.toSet(),
///   specialCharacters: '!@#$%^&*',
/// );
/// ```
String? validatePassword(
  String? value, {
  int minLength = 8,
  Set<PasswordRequirement> requirements = const {PasswordRequirement.minLength},
  String specialCharacters = r'[#?!@$%^&*-]',
}) {
  final rules = <ValidationRule>[
    Validators.required(message: 'Password is required'),
  ];

  if (requirements.contains(PasswordRequirement.minLength)) {
    rules.add(Validators.minLength(minLength,
        message: 'Password must be at least $minLength characters long'));
  }

  if (requirements.contains(PasswordRequirement.upperCase)) {
    rules.add(Validators.pattern(r'(?=.*[A-Z])',
        message: 'Password must have at least one uppercase character'));
  }

  if (requirements.contains(PasswordRequirement.lowerCase)) {
    rules.add(Validators.pattern(r'(?=.*[a-z])',
        message: 'Password must have at least one lowercase character'));
  }

  if (requirements.contains(PasswordRequirement.digit)) {
    rules.add(Validators.pattern(r'(?=.*\d)',
        message: 'Password must have at least one digit'));
  }

  if (requirements.contains(PasswordRequirement.special)) {
    final escapedSpecialChars = RegExp.escape(specialCharacters);
    rules.add(Validators.pattern(
      '(?=.*[$escapedSpecialChars])',
      message:
          'Password must have at least one special character ($specialCharacters)',
    ));
  }

  return Validators.validate(value, rules);
}

enum PasswordRequirement {
  minLength,
  upperCase,
  lowerCase,
  digit,
  special,
}
