import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Useful to log state change in our application
/// Read the logs and you'll better understand what's going on under the hood
class StateLogger extends ProviderObserver {
  const StateLogger();
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('''
      {
        provider: ${provider.name ?? provider.runtimeType},
        oldValue: $previousValue,
        newValue: $newValue
      }
      ''');
    }
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
