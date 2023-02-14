import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/budgets/budgets.dart';
import 'package:gmana_wallet/features/dashboard/dashboard.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:gmana_wallet/features/transactions/transactions.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const path = '/HomeView';
  static const name = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  _onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => _onPageChanged(index),
        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardView(),
          BudgetsView(),
          TransactionsView(),
          BudgetsView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(
              icon: Icon(Icons.savings_outlined), label: 'Saving'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Transactions'),
          NavigationDestination(icon: Icon(Icons.pie_chart), label: 'Budgets'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// class GNavigationBar extends HookConsumerWidget {
//   const GNavigationBar({Key? key, required this.activeView}) : super(key: key);

//   final int activeView;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return NavigationBar(
//       onDestinationSelected: (value) {
//         ref.read(activeViewController.notifier).state = value;
//       },
//       selectedIndex: activeView,
//       destinations: ref.watch(destinationsController).map((destination) {
//         return NavigationDestination(icon: Icon(destination.icon, color: destination.color), label: destination.title);
//       }).toList(),
//       // destinations: const [
//       //   NavigationDestination(icon: Icon(Icons.home), label: "Home"),
//       //   NavigationDestination(icon: Icon(Icons.savings_outlined), label: "Saving"),
//       //   NavigationDestination(icon: Icon(Icons.list), label: "Transactions"),
//       //   NavigationDestination(icon: Icon(Icons.category), label: "Budgets"),
//       //   NavigationDestination(icon: Icon(Icons.person), label: "Account"),
//       // ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:gmana_wallet/features/account/account.dart';
// import 'package:gmana_wallet/features/budget/budget.dart';
// import 'package:gmana_wallet/features/transactions/transactions.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../controller/active_view_controller.dart';
// import '../widgets/g_navigation_bar.dart';
// import '../widgets/g_navigation_rail.dart';

// class HomeView extends HookConsumerWidget {
//   const HomeView({super.key});
//   static const path = '/';

//   final List<Widget> _screens = const [
//     BudgetView(),
//     BudgetView(),
//     TransactionsView(),
//     BudgetView(),
//     AccountView(),
//   ];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final activeView = ref.watch(activeViewController);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("GMana Wallet"),
//         centerTitle: false,
//       ),
//       body: Row(
//         children: [
//           if (MediaQuery.of(context).size.width >= 640) const GNavigationRail(),
//           Expanded(child: _screens[activeView]),
//         ],
//       ),
//       bottomNavigationBar: MediaQuery.of(context).size.width < 640 ? GNavigationBar(activeView: activeView) : null,
//     );
//   }
// }
