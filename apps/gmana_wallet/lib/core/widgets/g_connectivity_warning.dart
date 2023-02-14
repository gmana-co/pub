import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/network/network.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GConnectivityWarning extends ConsumerWidget {
  const GConnectivityWarning({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print('ConnectivityWarning.build');
    }

    var network = ref.watch(networkController);

    return network == NetworkStatus.off
        ? Container(
            padding: const EdgeInsets.all(16),
            height: 60,
            color: Colors.red.shade500,
            child: Row(
              children: [
                Icon(Icons.wifi_off, color: Colors.grey.shade100),
                const SizedBox(width: 8),
                Text('No internet connection', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey.shade100)),
              ],
            ),
          )
        : Container();
  }
}
