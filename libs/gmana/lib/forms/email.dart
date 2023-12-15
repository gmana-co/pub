part of 'forms.dart';

class GEmail extends StatelessWidget {
  final TextEditingController controller;

  final TextInputAction textInputAction;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const GEmail(
    this.controller, {
    super.key,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.validator,
    this.hintText = 'Enter your email',
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      controller: controller,
      maxLength: 50,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: hintText,
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}
