import 'package:hive/hive.dart';
import '../models/expense_model.dart';

abstract class ExpenseTrackerLocalDataSource {
  Future<ExpenseModel> addExpense({required ExpenseModel expenseModel});
}

class ExpenseTrackerLocalDataSourceImpl
    implements ExpenseTrackerLocalDataSource {
  final Box<ExpenseModel> _expenseBox;
  ExpenseTrackerLocalDataSourceImpl(
    this._expenseBox,
  );
  @override
  Future<ExpenseModel> addExpense({required ExpenseModel expenseModel}) async {
    // await _expenseBox.p(expenseModel);
    throw UnimplementedError();
  }
}
