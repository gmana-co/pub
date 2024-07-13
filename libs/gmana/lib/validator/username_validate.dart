import 'validation_rule.dart';
import 'validators.dart';

class UsernameValidator {
  static List<ValidationRule> getRules({
    int minLength = 3,
    int maxLength = 20,
    Set<String> forbiddenCharacters = const {'@'},
    RegExp? allowedPattern,
  }) {
    return [
      Validators.required(message: 'Username is required'),
      Validators.minLength(minLength, message: 'Username must be at least $minLength characters long'),
      Validators.maxLength(maxLength, message: 'Username must not exceed $maxLength characters'),
      if (forbiddenCharacters.isNotEmpty)
        Validators.custom(
          (value) => value != null && forbiddenCharacters.any((char) => value.contains(char)) ? '' : null,
          message: 'Username cannot contain: ${forbiddenCharacters.join(', ')}',
        ),
      if (allowedPattern != null)
        Validators.pattern(
          allowedPattern.pattern,
          message: 'Username contains invalid characters',
        ),
    ];
  }

  static String? validate(
    String? value, {
    int minLength = 3,
    int maxLength = 20,
    Set<String> forbiddenCharacters = const {'@'},
    RegExp? allowedPattern,
  }) {
    final rules = <ValidationRule>[
      Validators.required(message: 'Username is required'),
      Validators.minLength(minLength, message: 'Username must be at least $minLength characters long'),
      Validators.maxLength(maxLength, message: 'Username must not exceed $maxLength characters'),
    ];

    if (forbiddenCharacters.isNotEmpty) {
      rules.add(Validators.custom(
        (value) => value != null && forbiddenCharacters.any((char) => value.contains(char)) ? '' : null,
        message: 'Username cannot contain: ${forbiddenCharacters.join(', ')}',
      ));
    }

    if (allowedPattern != null) {
      rules.add(Validators.pattern(
        allowedPattern.pattern,
        message: 'Username contains invalid characters',
      ));
    }

    return Validators.validate(value, rules);
  }
}
