import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gmana_wallet/core/utils/g_extensions.dart';
import 'package:gmana_wallet/features/account/account.dart';
import 'package:gmana_wallet/features/currencies/currencies.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrenciesView extends HookConsumerWidget {
  const CurrenciesView({super.key});

  static const location = '${AccountView.location}/currencies';
  static const name = 'currencies';
  static const path = 'currencies';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(currencyListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies'),
      ),
      body: currencies.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Text('Something went wrong...'),
        data: (data) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: data.length,
            separatorBuilder: (context, i) => const Divider(height: 1),
            itemBuilder: (context, i) {
              return ListTile(
                leading: SvgPicture.asset(
                  data[i].alpha_2_code.toLowerCase().imagePath,
                  semanticsLabel: data[i].alpha_2_code.toLowerCase(),
                  width: 50,
                ),
                title: Text('${data[i].alpha_3_code} (${data[i].symbol})'),
                subtitle: Text(data[i].title),
                trailing: const Icon(Icons.done),
              );
            },
          );
        },
      ),
    );
  }
}
