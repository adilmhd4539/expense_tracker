import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/category_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/chart_data_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/expense_data_entity.dart';
import 'package:expense_tracker/resorses/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/expense_entity.dart';

abstract class ExpenseTrackerRepository {
  Future<Either<Failure, List<Category>>> getCategories(
      {required CategoryType categoryType});
  Future<Either<Failure, Expense>> addExpense(
      {required double amount,
      required int categoryId,
      required String notes,
      required DateTime date});
  Future<Either<Failure, ExpenseData>> getExpenses(
      {DateTime? fromDt, DateTime? toDt});
  Future<Either<Failure, Expense>> editExpense({required Expense expense});
  Future<Either<Failure, bool>> deleteExpense({required int id});
  Future<Either<Failure, ChartData>> getChartData(
      {required CategoryType categoryType, DateTime? fromDt, DateTime? toDt});
}
