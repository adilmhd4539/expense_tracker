import 'package:expense_tracker/features/expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/features/expense_tracker/data/models/expense_model.dart';
import 'package:hive/hive.dart';

class DbServices {
  static void registerAdapters() {
    if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
      Hive.registerAdapter(CategoryModelAdapter());
    }
    if (!Hive.isAdapterRegistered(ExpenseModelAdapter().typeId)) {
      Hive.registerAdapter(ExpenseModelAdapter());
    }
  }
}
