import 'package:flutter/material.dart';

import 'base_field.dart';

class GPasswordField extends GBaseField {
  const GPasswordField({
    super.key,
    required super.controller,
    super.labelText = 'Password',
    super.hintText = 'Enter your password',
    super.textInputAction = TextInputAction.done,
    super.inputFormatters,
    super.validator,
    super.onChanged,
  }) : super(
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icons.lock,
        );

  @override
  Widget build(BuildContext context) {
    return _GPasswordFieldContent(baseField: this);
  }
}

class _GPasswordFieldContent extends StatefulWidget {
  final GPasswordField baseField;

  const _GPasswordFieldContent({required this.baseField});

  @override
  _GPasswordFieldContentState createState() => _GPasswordFieldContentState();
}

class _GPasswordFieldContentState extends State<_GPasswordFieldContent> {
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
