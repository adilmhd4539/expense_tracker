import 'package:expense_tracker/core/handlers/db/db_services.dart';
import 'package:expense_tracker/features/expense_tracker/data/data_source/expense_tracker_local_data_source.dart';
import 'package:expense_tracker/features/expense_tracker/data/models/add_expense_param_model.dart';
import 'package:expense_tracker/features/expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/features/expense_tracker/data/models/expense_model.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_event.dart';
import 'package:expense_tracker/resorses/enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../fixtures/fixtures.dart';

/// Initialize sqflite for test.
void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

Future main() async {
  late ExpenseTrackerLocalDataSource localDataSource;
  sqfliteTestInit();

  test('get category list test', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE ${DbServices.categoryTable}( category_id integer PRIMARY KEY AUTOINCREMENT, category_name text NOT NULL, category_type text NOT NULL); CREATE TABLE ${DbServices.expenseTable} ( id integer PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, notes TEXT NOT NULL, date TEXT NOT NULL, category_id INTEGER NOT NULL, FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION );');
    for (final raw in categoryList) {
      await db.insert(DbServices.categoryTable, {
        'category_name': raw['category_name'],
        'category_type': raw['category_type']
      });
    }
    localDataSource = ExpenseTrackerLocalDataSourceImpl(db);
    final result =
        await localDataSource.getCategories(categoryType: CategoryType.income);
    expect(result.length, 1);
    expect(result, isA<List<CategoryModel>>());
    await db.close();
  });
  test('test Adding expense', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE ${DbServices.categoryTable}( category_id integer PRIMARY KEY AUTOINCREMENT, category_name text NOT NULL, category_type text NOT NULL); CREATE TABLE ${DbServices.expenseTable} ( id integer PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, notes TEXT NOT NULL, date TEXT NOT NULL, category_id INTEGER NOT NULL, FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION );');
    for (final raw in categoryList) {
      await db.insert(DbServices.categoryTable, {
        'category_name': raw['category_name'],
        'category_type': raw['category_type']
      });
    }
    localDataSource = ExpenseTrackerLocalDataSourceImpl(db);
    await localDataSource
        .addExpense(
            param: AddExpenseParamModel(
                amount: 10,
                idCategory: 1,
                notes: 'dfj',
                date: DateTime.now().toIso8601String()))
        .then((value) {
      expect(value, isA<ExpenseModel>());
    });
    await db.close();
  });
  test('get expenses data', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE ${DbServices.categoryTable}( category_id integer PRIMARY KEY AUTOINCREMENT, category_name text NOT NULL, category_type text NOT NULL); CREATE TABLE ${DbServices.expenseTable} ( id integer PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, notes TEXT NOT NULL, date TEXT NOT NULL, category_id INTEGER NOT NULL, FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION );');
    for (final raw in categoryList) {
      await db.insert(DbServices.categoryTable, {
        'category_name': raw['category_name'],
        'category_type': raw['category_type']
      });
    }
    localDataSource = ExpenseTrackerLocalDataSourceImpl(db);
    await localDataSource
        .addExpense(
            param: AddExpenseParamModel(
                amount: 10,
                idCategory: 1,
                notes: 'dfj',
                date: DateTime.now().toIso8601String()))
        .then((value) {
      expect(value, isA<ExpenseModel>());
    });
    await localDataSource.getExpenses().then((value) {
      expect(value, isA<(List<ExpenseModel>, double, double)>());
      expect(value.$2, 10);
      expect(value.$3, 0);
    });
    await localDataSource
        .getExpenses(fromDt: DateTime(2020), toDt: DateTime(2021))
        .then((value) {
      expect(value, isA<(List<ExpenseModel>, double, double)>());
      expect(value.$2, 0);
      expect(value.$3, 0);
    });
    await db.close();
  });
  test('test editing expense', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE ${DbServices.categoryTable}( category_id integer PRIMARY KEY AUTOINCREMENT, category_name text NOT NULL, category_type text NOT NULL); CREATE TABLE ${DbServices.expenseTable} ( id integer PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, notes TEXT NOT NULL, date TEXT NOT NULL, category_id INTEGER NOT NULL, FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION );');
    for (final raw in categoryList) {
      await db.insert(DbServices.categoryTable, {
        'category_name': raw['category_name'],
        'category_type': raw['category_type']
      });
    }
    localDataSource = ExpenseTrackerLocalDataSourceImpl(db);
    final ExpenseModel expense = await localDataSource
        .addExpense(
            param: AddExpenseParamModel(
                amount: 10,
                idCategory: 1,
                notes: 'dfj',
                date: DateTime.now().toIso8601String()))
        .then((value) {
      expect(value, isA<ExpenseModel>());
      return value;
    });
    await localDataSource
        .editExpense(
            expense: AddExpenseParamModel(
                amount: 100,
                idCategory: 2,
                notes: 'abc',
                date: DateTime.now().toIso8601String()),
            id: expense.id)
        .then((value) {
      expect(value, isA<ExpenseModel>());
      expect(value.amount, 100);
      expect(value.notes, 'abc');
      expect(value.idCategory, 2);
      return value;
    });
    await db.close();
  });
  test('test deleting expense', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE ${DbServices.categoryTable}( category_id integer PRIMARY KEY AUTOINCREMENT, category_name text NOT NULL, category_type text NOT NULL); CREATE TABLE ${DbServices.expenseTable} ( id integer PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, notes TEXT NOT NULL, date TEXT NOT NULL, category_id INTEGER NOT NULL, FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION );');
    for (final raw in categoryList) {
      await db.insert(DbServices.categoryTable, {
        'category_name': raw['category_name'],
        'category_type': raw['category_type']
      });
    }
    localDataSource = ExpenseTrackerLocalDataSourceImpl(db);
    final expense = await localDataSource
        .addExpense(
            param: AddExpenseParamModel(
                amount: 10,
                idCategory: 1,
                notes: 'dfj',
                date: DateTime.now().toIso8601String()))
        .then((value) {
      expect(value, isA<ExpenseModel>());
      return value;
    });
    await localDataSource.deleteExpense(id: expense.id);

    await db.close();
  });
  test('test category wise chart data retrivig', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE ${DbServices.categoryTable}( category_id integer PRIMARY KEY AUTOINCREMENT, category_name text NOT NULL, category_type text NOT NULL); CREATE TABLE ${DbServices.expenseTable} ( id integer PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, notes TEXT NOT NULL, date TEXT NOT NULL, category_id INTEGER NOT NULL, FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION );');
    for (final raw in categoryList) {
      await db.insert(DbServices.categoryTable, {
        'category_name': raw['category_name'],
        'category_type': raw['category_type']
      });
    }
    localDataSource = ExpenseTrackerLocalDataSourceImpl(db);
    await localDataSource
        .addExpense(
            param: AddExpenseParamModel(
                amount: 10,
                idCategory: 1,
                notes: 'dfj',
                date: DateTime.now().toIso8601String()))
        .then((value) {
      expect(value, isA<ExpenseModel>());
    });
    await localDataSource
        .getCategoriyWiseExpense(categoryType: CategoryType.income)
        .then((value) {
      expect(value, isA<List<CategoryModel>>());
      expect(value.length, 1);
      expect(value[0].totalAmount, 10);
    });
    await db.close();
  });
}
