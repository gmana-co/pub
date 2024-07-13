import 'validation_rule.dart';
import 'validators.dart';

class ValidationRules {
  static final List<ValidationRule> email = [
    Validators.required(message: 'Email is required'),
    Validators.email(message: 'Email is invalid'),
  ];

  static final List<ValidationRule> password = [
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

  static final List<ValidationRule> username = [
    Validators.required(message: 'Username is required'),
    Validators.minLength(3, message: 'Username must be at least 3 characters long'),
    Validators.maxLength(20, message: 'Username must not exceed 20 characters'),
    Validators.custom(
      (value) => value!.contains('@') ? '' : null,
      message: 'Username cannot contain @',
    ),
  ];

  static final List<ValidationRule> otp = [
    Validators.required(message: 'OTP is required'),
    Validators.minLength(6, message: 'OTP must be at least 6 characters long'),
    Validators.maxLength(6, message: 'OTP must not exceed 6 characters'),
  ];
}
