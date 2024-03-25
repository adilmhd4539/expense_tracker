import 'package:expense_tracker/features/expense_tracker/domain/entities/expense_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/chart_data_entity.dart';
part 'generated/expense_tracker_state.freezed.dart';

@freezed
class ExpenseTrackerState with _$ExpenseTrackerState {
  const factory ExpenseTrackerState() = _ExpenseTrackerState;
  factory ExpenseTrackerState.initatl() = Initial;
  factory ExpenseTrackerState.feachingCategories() = FeachingCategories;
  factory ExpenseTrackerState.categoryFetchingError(
      {required Failure failure}) = CategoryFetchingError;
  factory ExpenseTrackerState.categoryFetchingSuccess(
      {required List<Category> categories}) = CategoryFetchingSuccess;
  factory ExpenseTrackerState.addingExpense() = AddingExpense;
  factory ExpenseTrackerState.addingExpenseFailed({required Failure failure}) =
      AddingExpenseFailed;
  factory ExpenseTrackerState.addingExpenseSuccesss() = AddingExpenseSuccess;
  factory ExpenseTrackerState.gettingExpenses() = GettingExpenses;
  factory ExpenseTrackerState.gettingExpensesSuccesss(
      {required ExpenseData data,
      required List<DateTime> dates,
      DateTime? fromDate,
      DateTime? toDate}) = GettingExpensesSuccess;
  factory ExpenseTrackerState.gettingExpensesFailed(
      {required Failure failure}) = GettingExpensesFailed;

  factory ExpenseTrackerState.editingExpens() = EditingExpense;
  factory ExpenseTrackerState.editingExpenseFaild({required Failure failure}) =
      EditingExpenseFailed;
  factory ExpenseTrackerState.editingExpenseSuccess() = EditingExpenseSuccess;
  factory ExpenseTrackerState.deletingExpense() = DeletingExpense;
  factory ExpenseTrackerState.deletingExpenseFailed({
    required Failure failure,
  }) = DeletingExpenseFailed;
  factory ExpenseTrackerState.deletingExpenseSuccess() = DeletingExpenseSuccess;
  factory ExpenseTrackerState.getingChartData() = GetingChartData;
  factory ExpenseTrackerState.getingChartDataFailed(
      {required Failure failure}) = GetingChartFiled;
  factory ExpenseTrackerState.getingChartSuccess({
    required ChartData data,
    required List<Color> colors,
    DateTime? fromDt,
    DateTime? toDt,
  }) = GettingChartDataSuccess;
}
