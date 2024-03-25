import 'package:expense_tracker/resorses/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/expense_entity.dart';
part 'generated/expense_tracker_event.freezed.dart';

@freezed
class ExpenseTrackerEvent with _$ExpenseTrackerEvent {
  const factory ExpenseTrackerEvent.feachCategories(
      {required CategoryType categoryType}) = FeachCategories;
  const factory ExpenseTrackerEvent.addExpense({
    required int categoryId,
    required double amount,
    required String notes,
    required DateTime dateTime,
  }) = AddExpense;
  const factory ExpenseTrackerEvent.getExpenses(
      {DateTime? fromDt, DateTime? toDt}) = GetExpenses;
  const factory ExpenseTrackerEvent.editExpense({required Expense expense}) =
      EditExpense;
  const factory ExpenseTrackerEvent.deleteExpense({required int id}) =
      DeleteExpense;
  const factory ExpenseTrackerEvent.getChartData(
      {required CategoryType categoryType,
      DateTime? fromDt,
      DateTime? toDate}) = GetChartData;
}
