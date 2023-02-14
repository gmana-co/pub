import 'package:flutter/material.dart';
import 'package:gmana_ext/gmana_ext.dart';
import 'package:gmana_wallet/features/category/category.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryView extends HookConsumerWidget {
  const CategoryView({super.key});

  static const location = '${SettingsView.path}/category';
  static const name = 'category';
  static const path = 'category';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: categories.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Text('Something went wrong...'),
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, i) => const Divider(height: 1),
            itemBuilder: (context, i) {
              return ListTile(
                leading: Icon(data[i].icon?.toIconData()),
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
