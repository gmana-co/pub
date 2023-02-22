import 'package:gmana_wallet/core/providers/providers.dart';
import 'package:gmana_wallet/features/category/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'category_service.g.dart';

@Riverpod(keepAlive: true)
CategoryRepository categoryRepository(CategoryRepositoryRef ref) => CategoryRepository(ref.watch(supabaseProvider));

@Riverpod(keepAlive: true)
Future<List<CategoryModel>> categoryList(CategoryListRef ref) async {
  final CategoryRepository categoryRepository = ref.watch(categoryRepositoryProvider);
  return categoryRepository.list();
}

@Riverpod(keepAlive: true)
Future<CategoryModel?> categoryGet(CategoryGetRef ref, {required String id}) async {
  final CategoryRepository categoryRepository = ref.watch(categoryRepositoryProvider);
  return categoryRepository.get({'id': id});
}

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
