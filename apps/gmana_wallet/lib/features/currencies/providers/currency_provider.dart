import 'package:gmana_wallet/features/currencies/currencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<CurrencyModel>> currencyList(CurrencyListRef ref) async => ref.watch(currencyRepositoryProvider).list();

@Riverpod(keepAlive: true)
Future<CurrencyModel?> currencyGet(CurrencyGetRef ref, {required String id}) async => ref.watch(currencyRepositoryProvider).get({'id': id});
