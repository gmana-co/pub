import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
class CurrencyModel with _$CurrencyModel {
  const factory CurrencyModel({
    required String id,
    required String title,
    required String symbol,
    required String alpha_2_code,
    required String alpha_3_code,
    required String name_plural,
  }) = _CurrencyModel;

  factory CurrencyModel.fromJson(Map<String, Object?> json) =>
      _$CurrencyModelFromJson(json);
}
