import 'package:flutter/material.dart';
import 'package:gmana_wallet/core/localization/localization.dart';
import 'package:gmana_wallet/features/language/language.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LanguageView extends HookConsumerWidget {
  const LanguageView({super.key});
  static const name = 'language';
  static const path = 'language';
  static const location = '${SettingsView.location}/language';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.languages),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text('ភាសាខ្មែរ'),
                  trailing:
                      language.language == 'km' ? const Icon(Icons.done) : null,
                  onTap: () =>
                      ref.read(languageProvider.notifier).setLanguage('km'),
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('English'),
                  trailing:
                      language.language == 'en' ? const Icon(Icons.done) : null,
                  onTap: () =>
                      ref.read(languageProvider.notifier).setLanguage('en'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
