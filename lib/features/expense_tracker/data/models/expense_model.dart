// ignore_for_file: invalid_annotation_target

import 'package:expense_tracker/resorses/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/expense_model.freezed.dart';
part 'generated/expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel(
      {@JsonKey(name: "id") required int id,
      @JsonKey(name: "amount") required double amount,
      @JsonKey(name: "id_category ") required int idCategory,
      @JsonKey(name: "category_name") required String categoryName,
      @JsonKey(name: "category_type") required CategoryType categoryType,
      @JsonKey(name: "notes") required String notes,
      @JsonKey(name: "date") required DateTime date}) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}
