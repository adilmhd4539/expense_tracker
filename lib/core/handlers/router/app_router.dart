import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../features/expense_tracker/domain/entities/expense_entity.dart';
import '../../../features/expense_tracker/presentation/screens/add_expense_traker_screen.dart';
import '../../../features/expense_tracker/presentation/screens/dash_board_screen.dart';
import '../../../features/expense_tracker/presentation/screens/home_screen.dart';
import '../../../features/expense_tracker/presentation/screens/main_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          maintainState: false,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
              maintainState: false,
            ),
            AutoRoute(
              page: DashBoardRoute.page,
              maintainState: false,
            ),
          ],
        ),
        AutoRoute(
          page: AddExpenseTrackerRoute.page,
        )
      ];
}
