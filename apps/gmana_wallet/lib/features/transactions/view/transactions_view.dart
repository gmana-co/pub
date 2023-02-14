import 'package:flutter/material.dart';
import 'package:gmana_wallet/core/localization/localization.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});
  static const name = 'transactions';
  static const path = '/transactions';
  static const location = '/transactions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.transactions)),
      body: const Center(
        child: Text('Transactions'),
      ),
    );
  }
}
