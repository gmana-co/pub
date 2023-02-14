import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/home/model/model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const List<DestinationModel> destinations = <DestinationModel>[
  DestinationModel(0, 'Home', Icons.home, Colors.green),
  DestinationModel(1, 'Saving', Icons.savings_outlined, Colors.cyan),
  DestinationModel(2, 'Transactions', Icons.list, Colors.teal),
  DestinationModel(3, 'Budgets', Icons.calculate_outlined, Colors.orange),
  // DestinationModel(4, 'Category', Icons.category, Colors.orange),
  DestinationModel(5, 'Settings', Icons.settings, Colors.blue),
  // DestinationModel(6, 'Account', Icons.person, Colors.blue),
];

final destinationsController = StateProvider((ref) {
  return destinations;
});
