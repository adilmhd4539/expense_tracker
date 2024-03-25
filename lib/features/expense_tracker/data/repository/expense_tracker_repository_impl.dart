import 'package:dartz/dartz.dart';
import 'package:expense_tracker/core/failure/failure.dart';
import 'package:expense_tracker/features/expense_tracker/data/data_source/expense_tracker_local_data_source.dart';
import 'package:expense_tracker/features/expense_tracker/data/models/add_expense_param_model.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/category_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/chart_data_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/expense_data_entity.dart';
import 'package:expense_tracker/features/expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/resorses/enums.dart';

import '../../domain/repository/expense_tracker_repository.dart';

class ExpenseTrackerRepositoryImpl implements ExpenseTrackerRepository {
  final ExpenseTrackerLocalDataSource _dataSource;

  ExpenseTrackerRepositoryImpl(
      {required ExpenseTrackerLocalDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<Category>>> getCategories(
      {required CategoryType categoryType}) async {
    try {
      return await _dataSource.getCategories(categoryType: categoryType).then(
          (value) =>
              Right(value.map((e) => Category.fromJson(e.toJson())).toList()));
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }

  @override
  Future<Either<Failure, Expense>> addExpense(
      {required double amount,
      required int categoryId,
      required String notes,
      required DateTime date}) async {
    try {
      final result = await _dataSource.addExpense(
          param: AddExpenseParamModel(
              amount: amount,
              idCategory: categoryId,
              notes: notes,
              date: date.toIso8601String()));
      return Right(Expense(
          id: result.id,
          amount: result.amount,
          notes: result.notes,
          date: result.date,
          category: Category(
              categoryId: result.idCategory,
              categoryName: result.categoryName,
              categoryType: result.categoryType)));
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }

  @override
  Future<Either<Failure, ExpenseData>> getExpenses(
      {DateTime? fromDt, DateTime? toDt}) async {
    try {
      final result = await _dataSource.getExpenses(fromDt: fromDt, toDt: toDt);
      return Right(ExpenseData(
          expenseList: result.$1
              .map((e) => Expense(
                  amount: e.amount,
                  category: Category(
                      categoryId: e.idCategory,
                      categoryName: e.categoryName,
                      categoryType: e.categoryType),
                  date: e.date,
                  id: e.id,
                  notes: e.notes))
              .toList(),
          totalIncome: result.$2,
          balace: result.$2 - result.$3,
          totalExpense: result.$3));
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }

  @override
  Future<Either<Failure, Expense>> editExpense(
      {required Expense expense}) async {
    try {
      final result = await _dataSource.editExpense(
          expense: AddExpenseParamModel(
              amount: expense.amount,
              idCategory: expense.category.categoryId,
              notes: expense.notes,
              date: expense.date.toIso8601String()),
          id: expense.id);
      return Right(Expense(
          id: result.id,
          amount: result.amount,
          notes: result.notes,
          date: result.date,
          category: Category(
              categoryId: result.idCategory,
              categoryName: result.categoryName,
              categoryType: result.categoryType)));
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteExpense({required int id}) async {
    try {
      final result = await _dataSource.deleteExpense(id: id);
      return Right(result);
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }

  @override
  Future<Either<Failure, ChartData>> getChartData(
      {required CategoryType categoryType,
      DateTime? fromDt,
      DateTime? toDt}) async {
    try {
      final result = await _dataSource.getCategoriyWiseExpense(
          categoryType: categoryType, fromDate: fromDt, toDate: toDt);
      double total = 0;

      final List<Category> categories = [];
      for (final category in result) {
        categories.add(Category.fromJson(category.toJson()));
        total = total + category.totalAmount;
      }

      return Right(ChartData(totalAmout: total, categories: categories));
    } catch (e) {
      return const Left(Failure.unknownFailure());
    }
  }
}
