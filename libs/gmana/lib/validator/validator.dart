import 'package:gmana/validator/validation_rules.dart';
import 'package:gmana/validator/validators.dart';

export 'email_validate.dart';
export 'password_validate.dart';
export 'username_validate.dart';
export 'validation_rule.dart';
export 'validation_rules.dart';
export 'validators.dart';

String? validateEmail(String? value) => Validators.validate(value, ValidationRules.email);
String? validateOtp(String? value) => Validators.validate(value, ValidationRules.otp);
String? validatePassword(String? value) => Validators.validate(value, ValidationRules.password);
String? validateUsername(String? value) => Validators.validate(value, ValidationRules.username);
