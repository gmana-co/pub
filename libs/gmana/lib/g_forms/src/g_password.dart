import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GPassword extends StatelessWidget {
  const GPassword(
    this.controller, {
    super.key,
    this.textInputAction = TextInputAction.next,
    this.obscureText = true,
    this.labelText = 'Password',
    this.hintText = 'Enter your password',
    this.inputFormatters,
    this.validator,
    this.onIconPressed,
    this.onChanged,
  });

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function()? onIconPressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: textInputAction,
      controller: controller,
      maxLength: 50,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(obscureText ? Icons.password : Icons.text_fields),
        suffixIcon: IconButton(
          onPressed: onIconPressed,
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
