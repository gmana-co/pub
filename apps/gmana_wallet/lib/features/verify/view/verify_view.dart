import 'package:flutter/material.dart';
import 'package:gmana/gmana.dart';
import 'package:gmana_ext/gmana_ext.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:gmana_wallet/features/dashboard/dashboard.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key, required this.email});
  static const name = 'verify';
  static const path = '/verify/:email';
  static const location = '/verify';
  final String email;

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  late final TextEditingController pinCodeController;

  Future<void> _verify() async {
    setState(() {
      isLoading = true;
    });
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      FocusScope.of(context).unfocus();

      try {
        await supabase.auth.verifyOTP(
            email: widget.email,
            token: pinCodeController.text.trim(),
            type: OtpType.signup);

        if (mounted) {
          context.go(DashboardView.location);
        }
      } catch (e) {
        context.showErrorSnackBar(message: 'Something went wrong.');
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    pinCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pinCodeController.dispose();
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
            GPassword(pinCodeController, textInputAction: TextInputAction.done),
            sizedBoxHeight,
            ElevatedButton(
              onPressed: isLoading ? null : _verify,
              child: Text(isLoading ? 'Loading' : 'Sign Up',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
