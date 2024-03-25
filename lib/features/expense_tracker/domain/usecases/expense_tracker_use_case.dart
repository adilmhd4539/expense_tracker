import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/category_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/chart_data_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/expense_data_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/repository/expense_tracker_repository.dart';
import 'package:expense_tracker/resorses/enums.dart';

import '../entities/expense_entity.dart';

class ExpenseTrackerUsecase {
  final ExpenseTrackerRepository _repository;

  ExpenseTrackerUsecase({required ExpenseTrackerRepository repository})
      : _repository = repository;
  Future<Either<Failure, List<Category>>> getCategories(
      {required CategoryType categoryType}) async {
    return await _repository.getCategories(categoryType: categoryType);
  }

  Future<Either<Failure, Expense>> addExpense(
      {required double amount,
      required int categoryId,
      required String notes,
      required DateTime date}) async {
    return await _repository.addExpense(
        amount: amount, categoryId: categoryId, notes: notes, date: date);
  }

  Future<Either<Failure, ExpenseData>> getExpenses(
      {DateTime? fromDt, DateTime? toDt}) async {
    return await _repository.getExpenses(fromDt: fromDt, toDt: toDt);
  }

  Future<Either<Failure, Expense>> editExpense(
      {required Expense expense}) async {
    return await _repository.editExpense(expense: expense);
  }

  Future<Either<Failure, bool>> deleteExpense({required int id}) async {
    return await _repository.deleteExpense(id: id);
  }

  Future<Either<Failure, ChartData>> getChartData(
      {required CategoryType categoryType,
      DateTime? fromDt,
      DateTime? toDt}) async {
    return await _repository.getChartData(
        categoryType: categoryType, fromDt: fromDt, toDt: toDt);
  }
}
