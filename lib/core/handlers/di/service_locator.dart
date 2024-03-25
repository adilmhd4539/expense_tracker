import 'package:expense_tracker/core/handlers/db/db_services.dart';
import 'package:expense_tracker/core/handlers/router/app_router.dart';
import 'package:expense_tracker/features/expense_tracker/data/data_source/expense_tracker_local_data_source.dart';
import 'package:expense_tracker/features/expense_tracker/data/repository/expense_tracker_repository_impl.dart';
import 'package:expense_tracker/features/expense_tracker/domain/usecases/expense_tracker_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../features/expense_tracker/domain/repository/expense_tracker_repository.dart';

final getIt = GetIt.instance;
Future<void> registerServiceLocatior() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<Database>(await DbServices.initializeDb());
  getIt.registerSingleton<ExpenseTrackerLocalDataSource>(
      ExpenseTrackerLocalDataSourceImpl(getIt<Database>()));
  getIt.registerSingleton<ExpenseTrackerRepository>(
      ExpenseTrackerRepositoryImpl(
          dataSource: getIt<ExpenseTrackerLocalDataSource>()));
  getIt.registerSingleton<ExpenseTrackerUsecase>(
      ExpenseTrackerUsecase(repository: getIt<ExpenseTrackerRepository>()));
}
