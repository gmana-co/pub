part of '../gmana.dart';

/// GNumberField
/// ```dart
/// GNumberField(
///   controller: ageController,
///   labelText: 'Age',
///   hintText: 'Enter your age',
///   minValue: 18,
///   maxValue: 100,
/// )
/// ```
class GNumberField extends GBaseField {
  final int? minValue;
  final int? maxValue;

  GNumberField({
    super.key,
    required super.controller,
    required super.labelText,
    super.hintText,
    super.textInputAction,
    List<TextInputFormatter>? inputFormatters,
    super.validator,
    super.onChanged,
    this.minValue,
    this.maxValue,
  }) : super(
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            ...?inputFormatters,
          ],
          prefixIcon: Icons.numbers,
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      validator: (value) {
        if (validator != null) {
          final result = validator!(value);
          if (result != null) return result;
        }
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        final number = int.tryParse(value);
        if (number == null) {
          return 'Please enter a valid number';
        }
        if (minValue != null && number < minValue!) {
          return 'Number must be at least $minValue';
        }
        if (maxValue != null && number > maxValue!) {
          return 'Number must be at most $maxValue';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
