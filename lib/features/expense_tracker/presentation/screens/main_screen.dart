import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/core/handlers/router/app_router.dart';

import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [HomeRoute(), DashBoardRoute(), SettingsRoute()],
        builder: (context, child) {
          TabsRouter tabRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                if (tabRouter.activeIndex != value) {
                  tabRouter.setActiveIndex(
                    value,
                  );
                }
              },
              currentIndex: tabRouter.activeIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Graph'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings')
              ],
            ),
          );
        });
  }
}
