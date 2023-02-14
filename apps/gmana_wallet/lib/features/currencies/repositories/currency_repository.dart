import 'package:gmana_wallet/core/providers/providers.dart';
import 'package:gmana_wallet/features/currencies/currencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'currency_repository.g.dart';

@Riverpod(keepAlive: true)
CurrencyRepository currencyRepository(CurrencyRepositoryRef ref) =>
    CurrencyRepository(ref.watch(supabaseProvider));

class CurrencyRepository {
  CurrencyRepository(this._client);

  final SupabaseClient _client;
  String get table => 'countries';

  Future<List<CurrencyModel>> list() async {
    try {
      final response = await _client
          .from(table)
          .select<PostgrestList>()
          .match({'active': true}).order('alpha_3_code', ascending: true);
      return response.map((e) => CurrencyModel.fromJson(e)).toList();
    } catch (e) {
      return List.empty();
    }
  }

  Future<CurrencyModel?> get(Map<dynamic, dynamic> query) async {
    try {
      final response =
          await _client.from(table).select<CurrencyModel>().match(query);
      return response;
    } catch (e) {
      return null;
    }
  }
}
