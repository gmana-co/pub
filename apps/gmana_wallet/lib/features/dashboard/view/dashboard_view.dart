import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const name = 'dashboard';
  static const path = '/dashboard';
  static const location = '/dashboard';

  Future<void> handleClick() async {
    try {
      throw Error();
    } catch (exception) {
      print('object');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          children: [const Text('Dashboard'), TextButton(onPressed: handleClick, child: const Text('Sentry'))],
        ),
      ),
    );
  }
}
