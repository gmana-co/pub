import 'validators.dart';

String? validateEmail(String? value) {
  return Validators.validate(value, [
    Validators.required(message: 'Email is required'),
    Validators.email(message: 'Email is invalid'),
  ]);
}
