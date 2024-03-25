// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_entity.dart';
part 'generated/expense_entity.freezed.dart';
part 'generated/expense_entity.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'notes') required String notes,
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'category') required Category category,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
