part of '../gmana.dart';

/// GEmailField
/// ```dart
/// GEmailField(
///   controller: emailController,
///   labelText: 'Email',
///   hintText: 'Enter Your Email',
/// )
/// ```
class GEmailField extends GBaseField {
  const GEmailField({
    super.key,
    required super.controller,
    super.labelText = 'Email',
    super.hintText = 'Enter your email',
    super.textInputAction,
    super.inputFormatters,
    String? Function(String?)? validator,
    super.onChanged,
  }) : super(
          keyboardType: TextInputType.emailAddress,
          validator: validator ?? GEmailField._defaultEmailValidator,
          prefixIcon: Icons.email,
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }

  static String? _defaultEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
