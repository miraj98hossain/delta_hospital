import 'package:delta_hospital/presentations/home/home.dart';
import 'package:delta_hospital/presentations/management/dashboard_login.dart';
import 'package:delta_hospital/presentations/management/dashboard_verify_otp.dart';
import 'package:delta_hospital/presentations/management/director.dart';
import 'package:delta_hospital/presentations/management/director_portal.dart';
import 'package:delta_hospital/presentations/management/management_dashboard.dart';
import 'package:delta_hospital/presentations/management/view/director_notice/director_notice_page.dart';
import 'package:delta_hospital/presentations/management/view/director_portfolio/director_portfolio_page.dart';
import 'package:delta_hospital/presentations/management/view/financial_dashboard/financial_dashboard_page.dart';
import 'package:delta_hospital/presentations/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashPage.routePath,
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
        path: SplashPage.routePath,
        name: SplashPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const SplashPage(),
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
        routes: [
          GoRoute(
            path: DashboardLoginPage.routePath,
            name: DashboardLoginPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const DashboardLoginPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: DashboardVerifyOtpPage.routePath,
            name: DashboardVerifyOtpPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const DashboardVerifyOtpPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: FinancialDashboardPage.routePath,
            name: FinancialDashboardPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const FinancialDashboardPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: DirectorPage.routePath,
            name: DirectorPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const DirectorPage(),
              state: state,
            ),
            routes: [
              GoRoute(
                path: DirectorPortalPage.routePath,
                name: DirectorPortalPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: const DirectorPortalPage(),
                  state: state,
                ),
              ),
              GoRoute(
                  path: DirectorPortfolioPage.routePath,
                  name: DirectorPortfolioPage.routeName,
                  pageBuilder: (context, state) => getPage(
                        child: const DirectorPortfolioPage(),
                        state: state,
                      ),
                  routes: [
                    GoRoute(
                      path: DirectorNoticePage.routePath,
                      name: DirectorNoticePage.routeName,
                      pageBuilder: (context, state) => getPage(
                        child: const DirectorNoticePage(),
                        state: state,
                      ),
                    ),
                  ]),
            ],
          ),
        ],
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
