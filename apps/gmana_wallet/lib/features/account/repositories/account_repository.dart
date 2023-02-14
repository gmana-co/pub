import 'package:gmana_wallet/core/providers/providers.dart';
import 'package:gmana_wallet/features/account/models/account_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'account_repository.g.dart';

@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) => AccountRepository(ref.watch(supabaseProvider));

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
