import 'package:gmana_wallet/features/account/models/account_model.dart';
import 'package:gmana_wallet/features/account/repositories/account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<AccountModel>> accountList(AccountListRef ref) async => ref.watch(accountRepositoryProvider).list();

@Riverpod(keepAlive: true)
Future<AccountModel?> accountGet(AccountGetRef ref, {required String id}) async => ref.watch(accountRepositoryProvider).get({'id': id});
