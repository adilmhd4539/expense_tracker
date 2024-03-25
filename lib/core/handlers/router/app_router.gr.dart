// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddExpenseTrackerRoute.name: (routeData) {
      final args = routeData.argsAs<AddExpenseTrackerRouteArgs>(
          orElse: () => const AddExpenseTrackerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddExpenseTrackerScreen(
          key: args.key,
          expense: args.expense,
        ),
      );
    },
    DashBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashBoardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddExpenseTrackerScreen]
class AddExpenseTrackerRoute extends PageRouteInfo<AddExpenseTrackerRouteArgs> {
  AddExpenseTrackerRoute({
    Key? key,
    Expense? expense,
    List<PageRouteInfo>? children,
  }) : super(
          AddExpenseTrackerRoute.name,
          args: AddExpenseTrackerRouteArgs(
            key: key,
            expense: expense,
          ),
          initialChildren: children,
        );

  static const String name = 'AddExpenseTrackerRoute';

  static const PageInfo<AddExpenseTrackerRouteArgs> page =
      PageInfo<AddExpenseTrackerRouteArgs>(name);
}

class AddExpenseTrackerRouteArgs {
  const AddExpenseTrackerRouteArgs({
    this.key,
    this.expense,
  });

  final Key? key;

  final Expense? expense;

  @override
  String toString() {
    return 'AddExpenseTrackerRouteArgs{key: $key, expense: $expense}';
  }
}

/// generated route for
/// [DashBoardScreen]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
