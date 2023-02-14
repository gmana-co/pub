import 'package:gmana_wallet/features/category/models/category_model.dart';
import 'package:gmana_wallet/features/category/repositories/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<CategoryModel>> categoryList(CategoryListRef ref) async {
  final CategoryRepository categoryRepository =
      ref.watch(categoryRepositoryProvider);
  return categoryRepository.list();
}

@Riverpod(keepAlive: true)
Future<CategoryModel?> categoryGet(CategoryGetRef ref,
    {required String id}) async {
  final CategoryRepository categoryRepository =
      ref.watch(categoryRepositoryProvider);
  return categoryRepository.get({'id': id});
}
