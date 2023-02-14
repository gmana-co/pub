import 'package:flutter/material.dart';

class BudgetsView extends StatelessWidget {
  const BudgetsView({super.key});
  static const name = 'budgets';
  static const path = '/budgets';
  static const location = '/budgets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budgets')),
      body: const Center(
        child: Text('Budgets'),
      ),
    );
  }
}
