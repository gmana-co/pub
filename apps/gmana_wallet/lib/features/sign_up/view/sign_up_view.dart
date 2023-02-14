import 'package:flutter/material.dart';
import 'package:gmana/gmana.dart';
import 'package:gmana_ext/gmana_ext.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:gmana_wallet/features/verify/verify.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const name = 'sign-up';
  static const path = '/sign-up';
  static const location = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _password = '';
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });

    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      try {
        await supabase.auth.signUp(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        if (mounted) {
          context.go('${VerifyView.location}/${_emailController.text.trim()}');
        }
      } catch (e) {
        context.showErrorSnackBar(message: 'Something went wrong.');
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Sign Up',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            GEmail(
              _emailController,
              textInputAction: TextInputAction.next,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Email is required'),
                EmailValidator(errorText: 'Email is invalid'),
              ]),
            ),
            sizedBoxHeight,
            GPassword(
              _passwordController,
              textInputAction: TextInputAction.next,
              onChanged: (v) {
                setState(() {
                  _password = v;
                });
              },
              validator: MultiValidator([
                RequiredValidator(errorText: 'Password is required'),
                MinLengthValidator(8,
                    errorText: 'Password must be at least 8 digits long'),
                PatternValidator(r'(?=.*[A-Z])',
                    errorText:
                        'Passwords must have at least one uppercase character'),
                PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                    errorText:
                        'Passwords must have at least one special character')
              ]),
              obscureText: _obscurePassword,
              onIconPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            sizedBoxHeight,
            GPassword(
              _confirmPasswordController,
              textInputAction: TextInputAction.done,
              validator: MultiValidator([
                RequiredValidator(errorText: 'password is required'),
                MinLengthValidator(8,
                    errorText: 'password must be at least 8 digits long'),
                PatternValidator(r'(?=.*[A-Z])',
                    errorText:
                        'Passwords must have at least one uppercase character'),
                PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                    errorText:
                        'passwords must have at least one special character'),
                MatchValidator(_password,
                    errorText: 'Password must be the same'),
              ]),
              obscureText: _obscureConfirmPassword,
              onIconPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            sizedBoxHeight,
            ElevatedButton(
              onPressed: _isLoading ? null : _signUp,
              child: Text(_isLoading ? 'Loading' : 'Sign Up',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
