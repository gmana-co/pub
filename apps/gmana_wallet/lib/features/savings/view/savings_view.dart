import 'package:flutter/material.dart';

class SavingsView extends StatelessWidget {
  const SavingsView({super.key});
  static const name = 'savings';
  static const path = '/savings';
  static const location = '/savings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings'),
      ),
      body: Container(),
    );
  }
}
