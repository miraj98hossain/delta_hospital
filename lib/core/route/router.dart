import 'package:delta_hospital/features/auth/app_registration.dart';
import 'package:delta_hospital/features/auth/app_otp_verification.dart';
import 'package:delta_hospital/features/auth/view/app_login/app_login_page.dart';
import 'package:delta_hospital/features/book_appointment/book_appointment.dart';
import 'package:delta_hospital/features/book_appointment/doctor_list.dart';
import 'package:delta_hospital/features/book_appointment/patient_info.dart';
import 'package:delta_hospital/features/home/home.dart';
import 'package:delta_hospital/features/items_booking/cart.dart';
import 'package:delta_hospital/features/items_booking/item_list.dart';
import 'package:delta_hospital/features/items_booking/views/booking_info/booking_info_page.dart';
import 'package:delta_hospital/features/items_booking/views/patient_info/booking_patient_info_page.dart';
import 'package:delta_hospital/features/management/dashboard_login.dart';
import 'package:delta_hospital/features/management/dashboard_verify_otp.dart';
import 'package:delta_hospital/features/management/director.dart';
import 'package:delta_hospital/features/management/director_portal.dart';
import 'package:delta_hospital/features/management/management_dashboard.dart';
import 'package:delta_hospital/features/management/view/director_notice/director_notice_page.dart';
import 'package:delta_hospital/features/management/view/director_portfolio/director_portfolio_page.dart';
import 'package:delta_hospital/features/management/view/financial_dashboard/financial_dashboard_page.dart';
import 'package:delta_hospital/features/my_appointments/my_appointment.dart';
import 'package:delta_hospital/features/on_boarding/on_boarding.dart';
import 'package:delta_hospital/features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/book_appointment/appointment_info.dart';

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashPage.routePath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: SplashPage.routePath,
        name: SplashPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const SplashPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: OnBoardingPage.routePath,
        name: OnBoardingPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const OnBoardingPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: AppLoginPage.routePath,
        name: AppLoginPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const AppLoginPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: AppRegistrationPage.routePath,
        name: AppRegistrationPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const AppRegistrationPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: AppOtpVerificationPage.routePath,
        name: AppOtpVerificationPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const AppOtpVerificationPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: HomePage.routePath,
        name: HomePage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const HomePage(),
          state: state,
        ),
      ),
      GoRoute(
        path: DoctorListPage.routePath,
        name: DoctorListPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const DoctorListPage(),
          state: state,
        ),
        routes: [
          GoRoute(
            path: BookAppointmentPage.routePath,
            name: BookAppointmentPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const BookAppointmentPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: PatientInfoPage.routePath,
            name: PatientInfoPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const PatientInfoPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: AppointmentInfoPage.routePath,
            name: AppointmentInfoPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const AppointmentInfoPage(),
              state: state,
            ),
          ),
        ],
      ),
      GoRoute(
        path: ItemListPage.routePath,
        name: ItemListPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const ItemListPage(),
          state: state,
        ),
        routes: [
          GoRoute(
            path: CartPage.routePath,
            name: CartPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const CartPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: BookingPatientInfoPage.routePath,
            name: BookingPatientInfoPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const BookingPatientInfoPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: BookingInfoPage.routePath,
            name: BookingInfoPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const BookingInfoPage(),
              state: state,
            ),
          ),
        ],
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
      GoRoute(
        path: MyAppointmentPage.routePath,
        name: MyAppointmentPage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const MyAppointmentPage(),
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
