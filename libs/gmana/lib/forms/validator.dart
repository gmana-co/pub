part of 'forms.dart';

final emailValidators = MultiValidator([
  RequiredValidator(
    errorText: 'Email is required',
  ),
  EmailValidator(
    errorText: 'Email is invalid',
  ),
]);

final passwordValidators = MultiValidator([
  RequiredValidator(
    errorText: 'Password is required',
  ),
  MinLengthValidator(
    8,
    errorText: 'Password must be at least 8 digits long',
  ),
  PatternValidator(
    r'(?=.*[A-Z])',
    errorText: 'Passwords must have at least one uppercase character',
  ),
  PatternValidator(
    r'(?=.*?[#?!@$%^&*-])',
    errorText: 'Passwords must have at least one special character',
  )
]);

typedef FormFieldValidator<T> = String? Function(T? value);

class EmailValidator extends TextFieldValidator {
  EmailValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) => hasMatch(emailRegStr, value!, caseSensitive: false);
}

abstract class FieldValidator<T> {
  final String errorText;

  FieldValidator(this.errorText);

  String? call(T value) {
    return isValid(value) ? null : errorText;
  }

  bool isValid(T value);
}

class LengthRangeValidator extends TextFieldValidator {
  final int min;
  final int max;

  LengthRangeValidator({
    required this.min,
    required this.max,
    required String errorText,
  }) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return value!.length >= min && value.length <= max;
  }
}

// class MatchValidator {
//   final String errorText;

//   MatchValidator({required this.errorText});

//   String? validateMatch(String value, String value2) {
//     return value == value2 ? null : errorText;
//   }
// }

class MatchValidator extends TextFieldValidator {
  // final String value;
  final String value2;

  MatchValidator(this.value2, {required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return value == value2;
  }
}

class MaxLengthValidator extends TextFieldValidator {
  final int max;

  MaxLengthValidator(this.max, {required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    return value!.length <= max;
  }
}

class MinLengthValidator extends TextFieldValidator {
  final int min;

  MinLengthValidator(this.min, {required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    return value!.length >= min;
  }
}

// class DateValidator extends TextFieldValidator {
//   final String format;

//   DateValidator(this.format, {required String errorText}) : super(errorText);

//   @override
//   bool isValid(String? value) {
//     try {
//       DateFormat(format).parseStrict(value!);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }
// }

class MultiValidator extends FieldValidator<String?> {
  static String _errorText = '';
  final List<FieldValidator> validators;

  MultiValidator(this.validators) : super(_errorText);

  @override
  String? call(dynamic value) {
    return isValid(value) ? null : _errorText;
  }

  @override
  bool isValid(value) {
    for (FieldValidator validator in validators) {
      if (validator.call(value) != null) {
        _errorText = validator.errorText;
        return false;
      }
    }
    return true;
  }
}

class PatternValidator extends TextFieldValidator {
  final Pattern pattern;
  final bool caseSensitive;

  PatternValidator(this.pattern, {required String errorText, this.caseSensitive = true}) : super(errorText);

  @override
  bool isValid(String? value) => hasMatch(pattern.toString(), value!, caseSensitive: caseSensitive);
}

class RangeValidator extends TextFieldValidator {
  final num min;
  final num max;

  RangeValidator({required this.min, required this.max, required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    try {
      final numericValue = num.parse(value!);
      return (numericValue >= min && numericValue <= max);
    } catch (_) {
      return false;
    }
  }
}

class RequiredValidator extends TextFieldValidator {
  RequiredValidator({required String errorText}) : super(errorText);

  @override
  bool get ignoreEmptyValues => false;

  @override
  String? call(String? value) {
    return isValid(value) ? null : errorText;
  }

  @override
  bool isValid(String? value) {
    return value!.isNotEmpty;
  }
}

abstract class TextFieldValidator extends FieldValidator<String?> {
  TextFieldValidator(super.errorText);

  bool get ignoreEmptyValues => true;

  @override
  String? call(String? value) {
    return (ignoreEmptyValues && value!.isEmpty) ? null : super.call(value);
  }

  bool hasMatch(String pattern, String input, {bool caseSensitive = true}) {
    return RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);
  }
}
