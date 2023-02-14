import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileView extends HookConsumerWidget {
  const ProfileView({super.key});
  static const name = 'profile';
  static const path = 'profile';
  static const location = '${SettingsView.location}/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(),
    );
  }
}
