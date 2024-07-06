part of '../gmana.dart';

abstract class GBaseField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData? prefixIcon;

  const GBaseField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    required this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context);
}
