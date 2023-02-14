import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/budgets/budgets.dart';
import 'package:gmana_wallet/features/dashboard/dashboard.dart';
import 'package:gmana_wallet/features/savings/savings.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:gmana_wallet/features/transactions/transactions.dart';
import 'package:go_router/go_router.dart';

class GScaffold extends StatelessWidget {
  const GScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int idx) => _onItemTapped(idx, context),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.savings_outlined), label: 'Saving'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Transactions'),
          NavigationDestination(icon: Icon(Icons.pie_chart), label: 'Budgets'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(DashboardView.location)) {
      return 0;
    }
    if (location.startsWith(SavingsView.location)) {
      return 1;
    }
    if (location.startsWith(TransactionsView.location)) {
      return 2;
    }
    if (location.startsWith(BudgetsView.location)) {
      return 3;
    }
    if (location.startsWith(SettingsView.location)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(DashboardView.location);
        break;
      case 1:
        GoRouter.of(context).go(SavingsView.location);
        break;
      case 2:
        GoRouter.of(context).go(TransactionsView.location);
        break;
      case 3:
        GoRouter.of(context).go(BudgetsView.location);
        break;
      case 4:
        GoRouter.of(context).go(SettingsView.location);
        break;
    }
  }
}
