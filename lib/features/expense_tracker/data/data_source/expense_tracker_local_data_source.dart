import 'dart:developer';

import 'package:expense_tracker/core/handlers/db/db_services.dart';
import 'package:expense_tracker/resorses/enums.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/add_expense_param_model.dart';
import '../models/category_model.dart';
import '../models/expense_model.dart';

abstract class ExpenseTrackerLocalDataSource {
  Future<ExpenseModel> addExpense({required AddExpenseParamModel param});
  Future<List<CategoryModel>> getCategories(
      {required CategoryType categoryType});
  Future<(List<ExpenseModel>, double totolIncome, double totalExpens)>
      getExpenses({DateTime? fromDt, DateTime? toDt});
  Future<ExpenseModel> editExpense(
      {required AddExpenseParamModel expense, required int id});
  Future<bool> deleteExpense({required int id});
  Future<List<CategoryModel>> getCategoriyWiseExpense(
      {required CategoryType categoryType,
      DateTime? fromDate,
      DateTime? toDate});
}

class ExpenseTrackerLocalDataSourceImpl
    implements ExpenseTrackerLocalDataSource {
  final Database _db;
  ExpenseTrackerLocalDataSourceImpl(this._db);
  @override
  Future<ExpenseModel> addExpense({required AddExpenseParamModel param}) async {
    try {
      final int id = await _db.insert(DbServices.expenseTable, param.toJson());
      final ExpenseModel expense = await _db.rawQuery(
          'SELECT E.id,E.amount,E.notes,datetime(e.date) AS date,E.category_id,C.category_name,C.category_type FROM expense E INNER JOIN category C ON E.category_id=C.category_id WHERE E.id=?',
          [id]).then((value) => ExpenseModel.fromJson(value[0]));
      return expense;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategories(
      {required CategoryType categoryType}) async {
    try {
      List<CategoryModel> categories = await _db.query(DbServices.categoryTable,
          where: 'category_type=?',
          whereArgs: [
            categoryType == CategoryType.income ? 'INCOME' : "EXPENSE"
          ]).then(
          (value) => value.map((e) => CategoryModel.fromJson(e)).toList());
      return categories;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<(List<ExpenseModel>, double totolIncome, double totalExpens)>
      getExpenses({DateTime? fromDt, DateTime? toDt}) async {
    try {
      List<ExpenseModel> expenses = [];
      double totalIncome = 0;
      double totalExpenses = 0;
      if (fromDt != null && toDt != null) {
        expenses = await _db.rawQuery(
            'SELECT E.id,E.amount,E.notes,datetime(e.date) AS date,E.category_id,C.category_name,C.category_type FROM expense E INNER JOIN category C ON E.category_id=C.category_id WHERE DATE(E.date) BETWEEN DATE(?) AND DATE(?)',
            [
              fromDt.toIso8601String(),
              toDt.toIso8601String()
            ]).then(
            (value) => value.map((e) => ExpenseModel.fromJson(e)).toList());
        totalIncome = await _db.rawQuery(
            'SELECT COALESCE(SUM(E.amount),0.0) AS amount FROM ${DbServices.expenseTable} E INNER JOIN ${DbServices.categoryTable} C ON E.category_id=C.category_id WHERE C.category_type=? AND (DATE(E.date) BETWEEN DATE(?) AND DATE(?))',
            [
              'INCOME',
              fromDt.toIso8601String(),
              toDt.toIso8601String()
            ]).then((value) {
          value.map((e) => log(e.toString()));
          return value[0]['amount'] as double;
        });
        totalExpenses = await _db.rawQuery(
            'SELECT COALESCE(SUM(E.amount),0.0) AS amount FROM ${DbServices.expenseTable} E INNER JOIN ${DbServices.categoryTable} C ON E.category_id=C.category_id WHERE C.category_type=? AND (DATE(E.date) BETWEEN DATE(?) AND DATE(?))',
            [
              'EXPENSE',
              fromDt.toIso8601String(),
              toDt.toIso8601String()
            ]).then((value) {
          value.map((e) => log(e.toString()));
          return value[0]['amount'] as double;
        });
      } else {
        expenses = await _db
            .rawQuery(
                'SELECT E.id,E.amount,E.notes,datetime(e.date) AS date,E.category_id,C.category_name,C.category_type FROM expense E INNER JOIN category C ON E.category_id=C.category_id')
            .then(
                (value) => value.map((e) => ExpenseModel.fromJson(e)).toList());
        totalIncome = await _db.rawQuery(
            'SELECT COALESCE(SUM(E.amount),0.0) AS amount FROM ${DbServices.expenseTable} E INNER JOIN ${DbServices.categoryTable} C ON E.category_id=C.category_id WHERE C.category_type=?',
            ['INCOME']).then((value) {
          value.map((e) => log(e.toString()));
          return value[0]['amount'] as double;
        });
        totalExpenses = await _db.rawQuery(
            'SELECT COALESCE(SUM(E.amount),0.0) AS amount FROM ${DbServices.expenseTable} E INNER JOIN ${DbServices.categoryTable} C ON E.category_id=C.category_id WHERE C.category_type=?',
            ['EXPENSE']).then((value) {
          value.map((e) => log(e.toString()));
          return value[0]['amount'] as double;
        });
      }
      return (expenses, totalIncome, totalExpenses);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ExpenseModel> editExpense(
      {required AddExpenseParamModel expense, required int id}) async {
    try {
      await _db.update(DbServices.expenseTable, expense.toJson(),
          where: 'id=?', whereArgs: [id]);
      final ExpenseModel updatedExpense = await _db.rawQuery(
          'SELECT E.id,E.amount,E.notes,datetime(e.date) AS date,E.category_id,C.category_name,C.category_type FROM expense E INNER JOIN category C ON E.category_id=C.category_id WHERE E.id=?',
          [id]).then((value) => ExpenseModel.fromJson(value[0]));
      return updatedExpense;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteExpense({required int id}) async {
    try {
      await _db
          .delete(DbServices.expenseTable, where: 'id = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategoriyWiseExpense(
      {required CategoryType categoryType,
      DateTime? fromDate,
      DateTime? toDate}) async {
    try {
      List<CategoryModel> categoryWiseExpense = [];
      if (fromDate == null && toDate == null) {
        categoryWiseExpense = await _db.rawQuery(
            'SELECT C.category_id ,C.category_name,C.category_type,COALESCE(SUM(E.amount),0) AS total_amount FROM ${DbServices.expenseTable} E INNER JOIN ${DbServices.categoryTable} C ON E.category_id = C.category_id WHERE C.category_type =? GROUP BY C.category_id ',
            [
              categoryType == CategoryType.expense ? "EXPENSE" : "INCOME"
            ]).then(
            (value) => value.map((e) => CategoryModel.fromJson(e)).toList());
      } else {
        categoryWiseExpense = await _db.rawQuery(
            'SELECT C.category_id ,C.category_name,C.category_type,COALESCE(SUM(E.amount),0) AS total_amount FROM ${DbServices.expenseTable} E INNER JOIN ${DbServices.categoryTable} C ON E.category_id = C.category_id WHERE C.category_type =? AND (DATE(E.date) BETWEEN DATE(?) AND DATE(?)) GROUP BY C.category_id ',
            [
              categoryType == CategoryType.expense ? "EXPENSE" : "INCOME",
              fromDate!.toIso8601String(),
              toDate!.toIso8601String(),
            ]).then(
            (value) => value.map((e) => CategoryModel.fromJson(e)).toList());
      }

      return categoryWiseExpense;
    } catch (e) {
      rethrow;
    }
  }
}
