import 'package:flutter/material.dart';
import 'package:gmana_wallet/features/account/account.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountView extends HookConsumerWidget {
  const AccountView({super.key});
  static const name = 'account_create';
  static const path = 'account_create';
  static const location = '${SettingsView.location}/account/create';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: accounts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Text('Something went wrong...'),
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, i) => const Divider(height: 1),
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(data[i].title),
                subtitle: Text(data[i].id),
              );
            },
          );
        },
      ),
    );
  }
}
