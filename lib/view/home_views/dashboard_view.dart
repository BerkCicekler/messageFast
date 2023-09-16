import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:messagefast/core/base/router/app_router.dart';
@RoutePage()
class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(routes: const [
      SearchRoute(),
      ContactRoute(),
      SettingsRoute(),
    ],
    bottomNavigationBuilder: (context, tabsRouter) {
      return BottomNavigationBar(
        
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Contacts"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
      ]);
    },
    );
  }
}