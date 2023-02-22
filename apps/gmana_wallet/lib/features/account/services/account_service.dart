import 'package:gmana_wallet/core/providers/providers.dart';
import 'package:gmana_wallet/features/account/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'account_service.g.dart';

@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) => AccountRepository(ref.watch(supabaseProvider));

@Riverpod(keepAlive: true)
Future<List<AccountModel>> accountList(AccountListRef ref) async {
  return ref.watch(accountRepositoryProvider).list();
}

@Riverpod(keepAlive: true)
Future<AccountModel?> accountGet(AccountGetRef ref, {required String id}) async {
  return ref.watch(accountRepositoryProvider).get({'id': id});
}

class AccountRepository {
  AccountRepository(this._client);

  final SupabaseClient _client;
  String get table => 'accounts';

  Future<List<AccountModel>> list() async {
    try {
      final response = await _client.from(table).select<PostgrestList>();
      return response.map((e) => AccountModel.fromJson(e)).toList();
    } catch (e) {
      return List.empty();
    }
  }

  Future<AccountModel?> get(Map<dynamic, dynamic> query) async {
    try {
      final response = await _client.from(table).select().match(query);
      return response;
    } catch (e) {
      return null;
    }
  }
}
