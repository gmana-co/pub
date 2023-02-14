import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String id,
    required String title,
    required String currency,
    required double amount,
    @Default(true) bool active,
    required String creator,
    DateTime? created,
  }) = _CategoryModel;
  factory AccountModel.fromJson(Map<String, Object?> json) => _$AccountModelFromJson(json);
}
