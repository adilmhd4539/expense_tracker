import 'package:freezed_annotation/freezed_annotation.dart';

import 'expense_entity.dart';
part 'generated/expense_data_entity.freezed.dart';
part 'generated/expense_data_entity.g.dart';

@freezed
class ExpenseData with _$ExpenseData {
  const factory ExpenseData(
      {required List<Expense> expenseList,
      required double totalIncome,
      required double balace,
      required double totalExpense}) = _ExpenseData;

  factory ExpenseData.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDataFromJson(json);
}
