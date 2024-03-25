import 'package:expense_tracker/core/handlers/di/service_locator.dart';
import 'package:expense_tracker/core/handlers/router/app_router.dart';
import 'package:expense_tracker/features/expense_tracker/domain/usecases/expense_tracker_use_case.dart';
import 'package:expense_tracker/features/expense_tracker/presentation/bloc/expense_tracker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resorses/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ExpenseTrackerBloc(
              getIt<ExpenseTrackerUsecase>(), getIt<AppRouter>()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: getIt<AppRouter>().config(),
        theme: AppTheme.appTheme,
      ),
    );
  }
}
