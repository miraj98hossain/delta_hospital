import 'dart:typed_data';

import 'package:delta_hospital/data/models/lookup_response.dart';
import 'package:delta_hospital/presentations/career/career_list.dart';
import 'package:delta_hospital/presentations/career/views/career_details/career_details_page.dart';
import 'package:delta_hospital/presentations/hn_registration/views/hn_registration/hn_registration_page.dart';
import 'package:delta_hospital/presentations/hospital_information/hospital_information.dart';
import 'package:delta_hospital/data/models/booking_info_model.dart';
import 'package:delta_hospital/data/models/item_grid_list_response.dart';
import 'package:delta_hospital/presentations/hospital_information/our_packages_details.dart';
import 'package:delta_hospital/presentations/hospital_information/views/our_packages/package_list/package_list_page.dart';
import 'package:delta_hospital/presentations/on_boarding/app_registration.dart';
import 'package:delta_hospital/presentations/on_boarding/app_otp_verification.dart';
import 'package:delta_hospital/presentations/on_boarding/views/app_login/app_login_page.dart';
import 'package:delta_hospital/presentations/book_appointment/book_appointment.dart';
import 'package:delta_hospital/presentations/book_appointment/doctor_list.dart';
import 'package:delta_hospital/presentations/book_appointment/patient_info.dart';
import 'package:delta_hospital/presentations/book_appointment/views/doctor_info/doctor_info_page.dart';
import 'package:delta_hospital/data/models/doctor_shift_list_response.dart';
import 'package:delta_hospital/presentations/doctor_portal/doctor_dash.dart';
import 'package:delta_hospital/presentations/doctor_portal/doctor_ipd_portal.dart';
import 'package:delta_hospital/presentations/doctor_portal/doctor_login.dart';
import 'package:delta_hospital/presentations/home/home.dart';
import 'package:delta_hospital/presentations/items_booking/cart.dart';
import 'package:delta_hospital/presentations/items_booking/item_list.dart';
import 'package:delta_hospital/presentations/items_booking/views/booking_info/booking_info_page.dart';
import 'package:delta_hospital/presentations/items_booking/views/patient_info/booking_patient_info_page.dart';
import 'package:delta_hospital/presentations/management/dashboard_login.dart';
import 'package:delta_hospital/presentations/management/dashboard_verify_otp.dart';
import 'package:delta_hospital/presentations/management/director.dart';
import 'package:delta_hospital/presentations/management/director_portal.dart';
import 'package:delta_hospital/presentations/management/management_dashboard.dart';
import 'package:delta_hospital/presentations/management/views/director_notice/director_notice_page.dart';
import 'package:delta_hospital/presentations/management/views/director_portfolio/director_portfolio_page.dart';
import 'package:delta_hospital/presentations/management/views/financial_dashboard/financial_dashboard_page.dart';
import 'package:delta_hospital/presentations/my_appointments/my_appointment.dart';
import 'package:delta_hospital/presentations/on_boarding/on_boarding.dart';
import 'package:delta_hospital/presentations/patient_portal/patient_list.dart';
import 'package:delta_hospital/presentations/patient_portal/pat_notes.dart';
import 'package:delta_hospital/presentations/patient_portal/patient_portal.dart';
import 'package:delta_hospital/presentations/patient_portal/patient_portal_dashboard.dart';
import 'package:delta_hospital/presentations/patient_portal/views/add_patient/add_patient_page.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_medical_record/pat_medical_record_page.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_prescription/pat_prescription_page.dart';
import 'package:delta_hospital/presentations/patient_portal/views/patient_portal_login/pat_portal_login_page.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pdf_viewer/pdf_viewer_page.dart';
import 'package:delta_hospital/presentations/payment/payment.dart';
import 'package:delta_hospital/presentations/profile/profile.dart';
import 'package:delta_hospital/presentations/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentations/book_appointment/appointment_info.dart';
import '../../data/models/doctor_grid_list_response.dart';
import '../../presentations/doctor_portal/doctor_opd_portal.dart';

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
        routes: [
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
        ],
      ),
      GoRoute(
        path: HomePage.routePath,
        name: HomePage.routeName,
        pageBuilder: (context, state) => getPage(
          child: const HomePage(),
          state: state,
        ),
        routes: [
          // Book Appointment
          GoRoute(
            path: DoctorListPage.routePath,
            name: DoctorListPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const DoctorListPage(),
              state: state,
            ),
            routes: [
              GoRoute(
                path: DoctorInfoPage.routePath,
                name: DoctorInfoPage.routeName,
                pageBuilder: (context, state) {
                  var map = state.extra as Map<String, dynamic>;
                  var doctor = map['doctor'] as Doctor;
                  return getPage(
                    child: DoctorInfoPage(
                      doctor: doctor,
                    ),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: BookAppointmentPage.routePath,
                name: BookAppointmentPage.routeName,
                pageBuilder: (context, state) {
                  var map = state.extra as Map<String, dynamic>;
                  var doctor = map['doctor'] as Doctor;
                  return getPage(
                    child: BookAppointmentPage(
                      doctor: doctor,
                    ),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: PatientInfoPage.routePath,
                name: PatientInfoPage.routeName,
                pageBuilder: (context, state) {
                  final map = state.extra as Map<String, dynamic>;
                  return getPage(
                    child: PatientInfoPage(
                      patientPortalUser: map['patient'],
                      patientType: map['patType'],
                      slot: map['slot'],
                      consultationType: map['consultationType'],
                      doctor: map['doctor'],
                    ),
                    state: state,
                  );
                },
              ),
              GoRoute(
                  path: AppointmentInfoPage.routePath,
                  name: AppointmentInfoPage.routeName,
                  pageBuilder: (context, state) {
                    final map = state.extra as Map<String, dynamic>;
                    return getPage(
                      child: AppointmentInfoPage(
                        patient: map['patient'],
                        patientType: map['patType'],
                        slot: map['slot'],
                        consultationType: map['consultationType'],
                        doctor: map['doctor'],
                      ),
                      state: state,
                    );
                  }),
            ],
          ),
          // Item List
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
                pageBuilder: (context, state) {
                  return getPage(
                    child: const CartPage(),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: BookingPatientInfoPage.routePath,
                name: BookingPatientInfoPage.routeName,
                pageBuilder: (context, state) {
                  return getPage(
                    child: BookingPatientInfoPage(
                      cartList: state.extra as List<ItemInfo>,
                    ),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: BookingInfoPage.routePath,
                name: BookingInfoPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: BookingInfoPage(
                    bookingInfo: state.extra as BookingInfoModel,
                  ),
                  state: state,
                ),
              ),
            ],
          ),
          // Patient Portal
          GoRoute(
            path: PatPortalDashboardPage.routePath,
            name: PatPortalDashboardPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const PatPortalDashboardPage(),
              state: state,
            ),
            routes: [
              GoRoute(
                path: PatPortalLoginPage.routePath,
                name: PatPortalLoginPage.routeName,
                pageBuilder: (context, state) {
                  final String mnr = state.uri.queryParameters['mrn'] ?? '';
                  return getPage(
                    child: PatPortalLoginPage(mrn: mnr),
                    state: state,
                  );
                },
              ),
              GoRoute(
                  path: PatientPortalPage.routePath,
                  name: PatientPortalPage.routeName,
                  pageBuilder: (context, state) => getPage(
                        child: const PatientPortalPage(),
                        state: state,
                      ),
                  routes: [
                    GoRoute(
                      path: PatPrescriptionPage.routePath,
                      name: PatPrescriptionPage.routeName,
                      pageBuilder: (context, state) => getPage(
                        child: const PatPrescriptionPage(),
                        state: state,
                      ),
                    ),
                    GoRoute(
                      path: PatMedicalRecordPage.routePath,
                      name: PatMedicalRecordPage.routeName,
                      pageBuilder: (context, state) => getPage(
                        child: const PatMedicalRecordPage(),
                        state: state,
                      ),
                    ),
                    GoRoute(
                      path: PatNotesPage.routePath,
                      name: PatNotesPage.routeName,
                      pageBuilder: (context, state) => getPage(
                        child: const PatNotesPage(),
                        state: state,
                      ),
                    ),
                  ]),
              GoRoute(
                path: AddPatientPage.routePath,
                name: AddPatientPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: const AddPatientPage(),
                  state: state,
                ),
              ),
              GoRoute(
                path: PatientListPage.routePath,
                name: PatientListPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: const PatientListPage(),
                  state: state,
                ),
              ),
              GoRoute(
                path: PdfViewerPage.routePath,
                name: PdfViewerPage.routeName,
                pageBuilder: (context, state) {
                  var map = state.extra as Map<String, dynamic>;
                  return getPage(
                    child: PdfViewerPage(
                      title: map['title'] as String,
                      pdfData: map['pdfData'] as Uint8List,
                    ),
                    state: state,
                  );
                },
              ),
            ],
          ),
          // Doctor Portal

          GoRoute(
            path: DoctorDashPage.routePath,
            name: DoctorDashPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const DoctorDashPage(),
              state: state,
            ),
            routes: [
              GoRoute(
                path: DoctorLoginPage.routePath,
                name: DoctorLoginPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: const DoctorLoginPage(),
                  state: state,
                ),
              ),
              GoRoute(
                path: DoctorOpdPortalPage.routePath,
                name: DoctorOpdPortalPage.routeName,
                pageBuilder: (context, state) {
                  var map = state.extra as Map<String, List<Shift>>;
                  return getPage(
                    child: DoctorOpdPortalPage(
                      shiftList: map['shiftList'] ?? [],
                    ),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: DoctorIpdPortalPage.routePath,
                name: DoctorIpdPortalPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: const DoctorIpdPortalPage(),
                  state: state,
                ),
              ),
              // GoRoute(
              //   path: FamilyListPage.routePath,
              //   name: FamilyListPage.routeName,
              //   pageBuilder: (context, state) => getPage(
              //     child: const FamilyListPage(),
              //     state: state,
              //   ),
              // ),
            ],
          ),
          // Management
          GoRoute(
            path: ManagementDashboardPage.routePath,
            name: ManagementDashboardPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const ManagementDashboardPage(),
              state: state,
            ),
            routes: [
              GoRoute(
                path: MngLoginPage.routePath,
                name: MngLoginPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: const MngLoginPage(),
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
          // Profile
          GoRoute(
            path: ProfilePage.routePath,
            name: ProfilePage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const ProfilePage(),
              state: state,
            ),
          ),
          GoRoute(
            path: HnRegistrationPage.routePath,
            name: HnRegistrationPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const HnRegistrationPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: CareerListPage.routePath,
            name: CareerListPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const CareerListPage(),
              state: state,
            ),
            routes: [
              GoRoute(
                path: CareerDetailsPage.routePath,
                name: CareerDetailsPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: CareerDetailsPage(
                    lookUpDetails: state.extra as LookUpDetails,
                  ),
                  state: state,
                ),
              ),
            ],
          ),
          GoRoute(
            path: PaymentPage.routePath,
            name: PaymentPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const PaymentPage(),
              state: state,
            ),
          ),
          GoRoute(
            path: HospitalInformationPage.routePath,
            name: HospitalInformationPage.routeName,
            pageBuilder: (context, state) => getPage(
              child: const HospitalInformationPage(),
              state: state,
            ),
            routes: [
              GoRoute(
                path: PackageListPage.routePath,
                name: PackageListPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: const PackageListPage(),
                  state: state,
                ),
              ),
              GoRoute(
                path: PackageDetailsPage.routePath,
                name: PackageDetailsPage.routeName,
                pageBuilder: (context, state) => getPage(
                  child: PackageDetailsPage(
                    lookUpDetails: state.extra as LookUpDetails,
                  ),
                  state: state,
                ),
              ),
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
