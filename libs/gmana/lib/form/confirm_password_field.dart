import 'package:flutter/material.dart';

import 'base_field.dart';

/// GConfirmPasswordField
/// ```dart
/// class GPasswordFields extends StatelessWidget {
///   final TextEditingController passwordController;
///   final TextEditingController confirmPasswordController;
///   final String? Function(String?)? passwordValidator;
///
///   const GPasswordFields({
///     Key? key,
///     required this.passwordController,
///     required this.confirmPasswordController,
///     this.passwordValidator,
///   }) : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return Column(
///       children: [
///         GPasswordField(
///           controller: passwordController,
///           validator: passwordValidator,
///         ),
///         const SizedBox(height: 16),
///         GConfirmPasswordField(
///           controller: confirmPasswordController,
///           passwordController: passwordController,
///         ),
///       ],
///     );
///   }
/// }
/// ```
class GConfirmPasswordField extends GBaseField {
  final TextEditingController passwordController;

  GConfirmPasswordField({
    super.key,
    required super.controller,
    required this.passwordController,
    super.labelText = 'Confirm Password',
    super.hintText = 'Re-enter your password',
    super.textInputAction = TextInputAction.done,
    super.inputFormatters,
    String? Function(String?)? additionalValidator,
    super.onChanged,
  }) : super(
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            if (additionalValidator != null) {
              return additionalValidator(value);
            }
            return null;
          },
          prefixIcon: Icons.lock,
        );

  @override
  Widget build(BuildContext context) {
    return _GConfirmPasswordFieldContent(baseField: this);
  }
}

class _GConfirmPasswordFieldContent extends StatefulWidget {
  final GConfirmPasswordField baseField;

  const _GConfirmPasswordFieldContent({required this.baseField});

  @override
  _GConfirmPasswordFieldContentState createState() =>
      _GConfirmPasswordFieldContentState();
}

class _GConfirmPasswordFieldContentState
    extends State<_GConfirmPasswordFieldContent> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.baseField.controller,
      obscureText: _obscureText,
      keyboardType: widget.baseField.keyboardType,
      textInputAction: widget.baseField.textInputAction,
      inputFormatters: widget.baseField.inputFormatters,
      validator: widget.baseField.validator,
      onChanged: widget.baseField.onChanged,
      decoration: InputDecoration(
        labelText: widget.baseField.labelText,
        hintText: widget.baseField.hintText,
        prefixIcon: Icon(widget.baseField.prefixIcon),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      ),
    );
  }
}
