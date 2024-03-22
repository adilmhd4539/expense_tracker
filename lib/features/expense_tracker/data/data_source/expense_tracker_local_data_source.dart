import 'package:expense_tracker/core/handlers/db/db_services.dart';
import 'package:sqflite/sqlite_api.dart';

import '../models/add_expense_param_model.dart';
import '../models/expense_model.dart';

abstract class ExpenseTrackerLocalDataSource {
  Future<ExpenseModel> addExpense({required AddExpenseParamModel param});
}

class ExpenseTrackerLocalDataSourceImpl
    implements ExpenseTrackerLocalDataSource {
  final Database _db;
  ExpenseTrackerLocalDataSourceImpl(this._db);
  @override
  Future<ExpenseModel> addExpense({required AddExpenseParamModel param}) async {
    final int id = await _db.insert(DbServices.expenseTable, param.toJson());
    throw UnimplementedError();
  }
}
