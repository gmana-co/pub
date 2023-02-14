import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/home/controller/destination_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/active_view_controller.dart';

class GNavigationBar extends HookConsumerWidget {
  const GNavigationBar({super.key, required this.activeView});

  final int activeView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationBar(
      onDestinationSelected: (value) {
        ref.read(activeViewController.notifier).state = value;
      },
      selectedIndex: activeView,
      destinations: ref.watch(destinationsController).map((destination) {
        return NavigationDestination(icon: Icon(destination.icon, color: destination.color), label: destination.title);
      }).toList(),
      // destinations: const [
      //   NavigationDestination(icon: Icon(Icons.home), label: "Home"),
      //   NavigationDestination(icon: Icon(Icons.savings_outlined), label: "Saving"),
      //   NavigationDestination(icon: Icon(Icons.list), label: "Transactions"),
      //   NavigationDestination(icon: Icon(Icons.category), label: "Budgets"),
      //   NavigationDestination(icon: Icon(Icons.person), label: "Account"),
      // ],
    );
  }
}
