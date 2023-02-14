import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum NetworkStatus { notDetermined, on, off }

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  StreamController<ConnectivityResult> controller = StreamController<ConnectivityResult>();

  late NetworkStatus lastResult;

  NetworkDetectorNotifier() : super(NetworkStatus.notDetermined) {
    lastResult = NetworkStatus.notDetermined;

    Connectivity().onConnectivityChanged.listen((result) {
      NetworkStatus? newState;
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = NetworkStatus.on;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.off;
          break;
        case ConnectivityResult.bluetooth:
          break;
        case ConnectivityResult.ethernet:
          break;
        case ConnectivityResult.vpn:
          break;
      }

      if (newState != state) {
        state = newState as NetworkStatus;
      }
    });
  }
}

final networkController = StateNotifierProvider.autoDispose((ref) => NetworkDetectorNotifier());
