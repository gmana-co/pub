import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const name = 'dashboard';
  static const path = '/dashboard';
  static const location = '/dashboard';

  Future<void> handleClick() async {
    try {
      throw Error();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
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
