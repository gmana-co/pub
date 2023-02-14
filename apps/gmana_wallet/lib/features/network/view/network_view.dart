import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/network/network.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NetworkView extends HookConsumerWidget {
  const NetworkView({super.key});
  static const name = 'network';
  static const path = 'network';
  static const location = '${SettingsView.location}/network';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var network = ref.watch(networkController);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Status'),
      ),
      body: network == NetworkStatus.off ? const Center(child: Text('No Internet')) : const Center(child: Text('Internet is on')),
    );
  }
}
