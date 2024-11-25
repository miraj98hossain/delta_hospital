import 'package:delta_hospital/presentations/home/home.dart';
import 'package:delta_hospital/presentations/management/management_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: HomePage.routePath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: HomePage.routePath,
        name: HomePage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const HomePage(),
          state: state,
        ),
      ),
      GoRoute(
        path: ManagementDashboardPage.routePath,
        name: ManagementDashboardPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const ManagementDashboardPage(),
          state: state,
        ),
      ),
    ],
  );

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
