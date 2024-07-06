part of '../gmana.dart';

class GTextField extends GBaseField {
  const GTextField({
    super.key,
    required super.controller,
    required super.labelText,
    super.hintText,
    super.textInputAction,
    super.inputFormatters,
    super.validator,
    super.onChanged,
    super.prefixIcon,
  }) : super(
          keyboardType: TextInputType.text,
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
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
    );
  }
}
