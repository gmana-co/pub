import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gmana/gmana.dart';
import 'package:gmana_ext/gmana_ext.dart';
import 'package:gmana_wallet/core/localization/app_context.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:gmana_wallet/features/forgot_password/forgot_password.dart';
import 'package:gmana_wallet/features/sign_up/sign_up.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const name = 'sign-in';
  static const path = '/sign-in';
  static const location = '/sign-in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscureText = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });

    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();

      try {
        await supabase.auth.signInWithPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (mounted) {
          // context.showSnackBar(message: 'Check your email for login link!');
          _emailController.clear();
          _passwordController.clear();
          // context.go(DashboardView.location);
        }
      } on AuthException catch (error) {
        if (mounted) {
          context.showErrorSnackBar(message: error.message);
        }
      } catch (error) {
        if (mounted) {
          context.showErrorSnackBar(message: context.loc.unexpected);
        }
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

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In', style: Theme.of(context).textTheme.headlineSmall)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            GEmail(
              _emailController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Email is required'),
                EmailValidator(errorText: 'Email is invalid'),
              ]),
            ),
            sizedBoxHeight,
            GPassword(
              _passwordController,
              textInputAction: TextInputAction.done,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Password is required'),
                MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
                PatternValidator(r'(?=.*[A-Z])', errorText: 'Passwords must have at least one uppercase character'),
                PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Passwords must have at least one special character')
              ]),
              obscureText: _obscureText,
              onIconPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            sizedBoxHeight,
            ElevatedButton(
              onPressed: _isLoading ? null : _signIn,
              child: _isLoading ? const GSpinnerDot(color: Colors.white, size: 24) : Text('Sign In', style: Theme.of(context).textTheme.labelLarge),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(child: const Text('Forgot Password'), onPressed: () => context.push(ForgotPasswordView.location)),
                TextButton(child: const Text('Sign Up'), onPressed: () => context.push(SignUpView.location)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
