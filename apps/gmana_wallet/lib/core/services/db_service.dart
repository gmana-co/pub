import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DbService<T> {
  final SupabaseClient client;
  final _logger = Logger();

  DbService(this.client);

  String tableName() {
    return '';
  }

  Future<List<Map<String, dynamic>>> findMany() async {
    _logger.i(tableName());
    final response = await client.from(tableName()).select<PostgrestList>();
    return response;
  }

  Future<PostgrestResponse> find(Map<dynamic, dynamic> query) async {
    _logger.i('${tableName()} $query');
    final response = await client.from(tableName()).select().match(query);
    _logger.i(response.toJson());
    return response;
  }

  // Future<List<CategoryModel>> getCategories() async {
  //   try {
  //     final response = await client.from(tableName()).select();
  //     return (response as List).map((e) {
  //       return CategoryModel.fromJson(e);
  //     }).toList();
  //   } catch (e) {
  //     return List.empty();
  //   }
  // }

  // Future<CategoryModel?> getCategoryById(String id) async {
  //   try {
  //     final response = await client.from('categories').select<CategoryModel>().match({'id': id});
  //     return response;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Future<Map<String, dynamic>> findById(String id) async {
    _logger.i('${tableName()} $id');
    final response = await client
        .from(tableName())
        .select<PostgrestMap>()
        .eq('id', id)
        .single();
    _logger.i(response);
    return response;
  }

  Future<PostgrestResponse> create(Map<String, dynamic> json) async {
    _logger.i('${tableName()} $json');
    final response = await client.from(tableName()).insert(json);
    _logger.i(response.toJson());
    return response;
  }

  Future<PostgrestResponse> update({
    required String id,
    required Map<String, dynamic> json,
  }) async {
    _logger.i('${tableName()} $json');
    final response = await client.from(tableName()).update(json).eq('id', id);
    _logger.i(response.toJson());
    return response;
  }

  Future<PostgrestResponse> delete(String id) async {
    _logger.i('${tableName()} $id');
    final response = await client.from(tableName()).delete().eq('id', id);
    _logger.i(response.toJson());
    return response;
  }
}
