import 'package:flutter/material.dart';
import 'package:gmana/gmana.dart';
import 'package:gmana_ext/gmana_ext.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:gmana_wallet/features/account/account.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountCreateView extends StatefulWidget {
  const AccountCreateView({super.key});
  static const name = 'account_create';
  static const path = 'account_create';
  static const location = '${AccountView.location}/account_create';

  @override
  State<AccountCreateView> createState() => AccountCreateViewState();
}

class AccountCreateViewState extends State<AccountCreateView> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  var _isLoading = false;

  Future<void> _getProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase.from('accounts').select().eq('id', userId).single() as Map;
      titleController.text = (data['title'] ?? '') as String;
      currencyController.text = (data['currency'] ?? '') as String;
      amountController.text = (data['amount'] ?? '') as String;
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected exception occurred');
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isLoading = true;
    });
    final title = titleController.text;
    final currency = currencyController.text;
    final amount = amountController.text;
    final user = supabase.auth.currentUser;
    final updates = {
      'id': user!.id,
      'title': title,
      'currency': currency,
      'amount': amount,
    };
    try {
      await supabase.from('accounts').upsert(updates);
      if (mounted) {
        context.showSnackBar(message: 'Successfully updated profile!');
      }
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  void dispose() {
    titleController.dispose();
    currencyController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            GText(
              titleController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Title is required'),
                // EmailValidator(errorText: 'Email is invalid'),
              ]),
            ),
            sizedBoxHeight,
            GText(
              currencyController,
              textInputAction: TextInputAction.next,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Password is required'),
              ]),
            ),
            GNumber(
              amountController,
              textInputAction: TextInputAction.done,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Password is required'),
              ]),
            ),
            sizedBoxHeight,
            ElevatedButton(
              onPressed: _isLoading ? null : () async => await _updateProfile(),
              child: _isLoading ? const GSpinnerDot(color: Colors.white, size: 24) : Text('Sign In', style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
