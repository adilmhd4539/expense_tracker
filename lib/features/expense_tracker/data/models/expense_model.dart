// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'category_model.dart';
part 'generated/expense_model.freezed.dart';
part 'generated/expense_model.g.dart';

@freezed
@HiveType(typeId: 0)
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel(
      {@HiveField(0) @JsonKey(name: "amount") required double amount,
      @HiveField(1) @JsonKey(name: "category") required CategoryModel category,
      @HiveField(2) @JsonKey(name: "notes") required String notes,
      @HiveField(3)
      @JsonKey(name: "date")
      required DateTime date}) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}
