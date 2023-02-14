import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:gmana_wallet/features/theme/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeView extends HookConsumerWidget {
  const ThemeView({super.key});
  static const name = 'theme';
  static const path = 'theme';
  static const location = '${SettingsView.location}/theme';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.brightness_6),
                  title: const Text('System Mode'),
                  trailing: theme.themeMode == ThemeMode.system
                      ? const Icon(Icons.done)
                      : null,
                  onTap: () {
                    ref
                        .read(themeProvider.notifier)
                        .setThemeMode(ThemeMode.system);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Dark Mode'),
                  trailing: theme.themeMode == ThemeMode.dark
                      ? const Icon(Icons.done)
                      : null,
                  onTap: () {
                    ref
                        .read(themeProvider.notifier)
                        .setThemeMode(ThemeMode.dark);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.light_mode),
                  title: const Text('Light Mode'),
                  trailing: theme.themeMode == ThemeMode.light
                      ? const Icon(Icons.done)
                      : null,
                  onTap: () {
                    ref
                        .read(themeProvider.notifier)
                        .setThemeMode(ThemeMode.light);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
