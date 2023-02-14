import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gmana/gmana.dart';
import 'package:gmana_ext/gmana_ext.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordView extends HookConsumerWidget {
  const ForgotPasswordView({super.key});
  static const name = 'forgot-password';
  static const path = '/forgot-password';
  static const location = '/forgot-password';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final isLoading = useState(false);

    final resetPasswordForEmail = useMemoized(
      () => () async {
        try {
          isLoading.value = true;
          await supabase.auth.resetPasswordForEmail(emailController.text);
          isLoading.value = false;
        } on AuthException catch (e) {
          context.showErrorSnackBar(message: e.message);
        } catch (e) {
          context.showErrorSnackBar(message: 'Something went wrong.');
        } finally {
          isLoading.value = false;
        }
      },
      [key],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            GEmail(emailController, textInputAction: TextInputAction.done),
            sizedBoxHeight,
            ElevatedButton(
              onPressed: isLoading.value ? null : resetPasswordForEmail,
              child: isLoading.value
                  ? const GSpinnerDot(color: Colors.white, size: 24)
                  : Text('Submit',
                      style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
