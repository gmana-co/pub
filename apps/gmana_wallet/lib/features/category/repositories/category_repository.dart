import 'package:gmana_wallet/core/providers/providers.dart';
import 'package:gmana_wallet/features/category/models/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'category_repository.g.dart';

@Riverpod(keepAlive: true)
CategoryRepository categoryRepository(CategoryRepositoryRef ref) => CategoryRepository(ref.watch(supabaseProvider));

class CategoryRepository {
  CategoryRepository(this._client);

  final SupabaseClient _client;
  String get table => 'categories';

  Future<List<CategoryModel>> list() async {
    try {
      final response = await _client.from(table).select<PostgrestList>();
      return (response).map((e) {
        return CategoryModel.fromJson(e);
      }).toList();
    } catch (e) {
      return List.empty();
    }
  }

  Future<CategoryModel?> get(Map<dynamic, dynamic> query) async {
    try {
      return await _client.from(table).select<CategoryModel>().match(query);
    } catch (e) {
      return null;
    }
  }
}
