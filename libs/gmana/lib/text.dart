part of 'gmana.dart';

class GText extends StatelessWidget {
  final TextEditingController controller;

  final TextInputAction textInputAction;
  final String labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const GText(
    this.controller, {
    super.key,
    this.textInputAction = TextInputAction.next,
    this.labelText = 'Password',
    this.hintText = 'Enter your password',
    this.inputFormatters,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      controller: controller,
      maxLength: 50,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: const Icon(Icons.text_fields),
      ),
    );
  }
}
