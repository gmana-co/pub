import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/home/controller/active_view_controller.dart';
import 'package:gmana_wallet/features/home/controller/destination_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GNavigationRail extends HookConsumerWidget {
  const GNavigationRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationRail(
      selectedIndex: ref.watch(activeViewController),
      onDestinationSelected: (value) => ref.read(activeViewController.notifier).state = value,
      destinations: ref.watch(destinationsController).map((e) {
        return NavigationRailDestination(icon: Icon(e.icon, color: e.color), label: Text(e.title));
      }).toList(),
      // destinations: const [
      //   NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
      //   NavigationRailDestination(icon: Icon(Icons.save_outlined), label: Text('Saving')),
      //   NavigationRailDestination(icon: Icon(Icons.list), label: Text('Transactions')),
      //   NavigationRailDestination(icon: Icon(Icons.category), label: Text('Budgets')),
      //   NavigationRailDestination(icon: Icon(Icons.person), label: Text('Account')),
      // ],
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle: const TextStyle(color: Colors.white),
      unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
      leading: Column(
        children: [
          // SizedBox(height: 8),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.person),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
