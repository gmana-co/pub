import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gmana/gmana.dart';
import 'package:gmana_ext/gmana_ext.dart';
import 'package:gmana_wallet/core/localization/localization.dart';
import 'package:gmana_wallet/features/account/account.dart';
import 'package:gmana_wallet/features/category/category.dart';
import 'package:gmana_wallet/features/language/language.dart';
import 'package:gmana_wallet/features/network/network.dart';
import 'package:gmana_wallet/features/theme/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});
  static const name = 'settings';
  static const path = '/settings';
  static const location = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final language = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(context.loc.settings,
                  style: Theme.of(context).textTheme.headlineSmall))),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text('Sun Sreng'),
              subtitle: const Text('012 311 739'),
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(
                    'https://github.com/sunsreng.png'),
              ),
              onTap: () => context.go('/settings/profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: Column(
              children: [
                GListTile(
                  icon: theme.themeMode.toIcon(),
                  title: 'Theme Mode',
                  label: theme.themeMode.toLabel(),
                  onTap: () => context.go(ThemeView.location),
                ),
                const Divider(height: 1),
                GListTile(
                  icon: Icons.language,
                  title: 'Languages',
                  label: language.language == 'km' ? 'Khmer' : 'English',
                  onTap: () => context.go(LanguageView.location),
                ),
                // const Divider(height: 1),
                // GListTile(
                //   icon: Icons.currency_exchange,
                //   title: 'Currency',
                //   label: 'Currency Label',
                //   onTap: () => context.go(CurrenciesView.location),
                // ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text('Accounts'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.go(AccountView.location),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Categories'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.go(CategoryView.location),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.pie_chart),
                  title: const Text('Budgets'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.go(CategoryView.location),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                GListTile(
                  icon: Icons.wifi,
                  title: 'Network',
                  label: '',
                  onTap: () => context.go(NetworkView.location),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async =>
                await Supabase.instance.client.auth.signOut(),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
