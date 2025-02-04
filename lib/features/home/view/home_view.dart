import 'dart:developer';

import 'package:delta_hospital/app/bloc/app_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';

import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/doctor_portal/doctor_dash.dart';
import 'package:delta_hospital/features/hn_registration/views/hn_registration/hn_registration_page.dart';
import 'package:delta_hospital/features/management/views/dashboard/management_dashboard_page.dart';
import 'package:delta_hospital/features/management/views/login/mng_login_page.dart';
import 'package:delta_hospital/features/my_appointments/my_appointment.dart';
import 'package:delta_hospital/features/on_boarding/views/on_boarding/on_boarding_page.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal_dashboard/pat_portal_dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../book_appointment/views/doctor_list/doctor_list_page.dart';
import '../../doctor_portal/doctor_login.dart';
import '../../items_booking/views/item_list/item_list_page.dart';
import '../home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const CommonDrawer(),
      appBar: CommonAppbar(
        onTap: () {
          _key.currentState?.openDrawer();
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 10,
            crossAxisSpacing: 15,
            mainAxisExtent: 100,
            mainAxisSpacing: 15,
          ),
          children: [
            ModuleWidget(
              lable: "Make Appointment",
              icon: ImageConstant.calander,
              onTap: () {
                context.pushNamed(DoctorListPage.routeName);
              },
            ),
            ModuleWidget(
              lable: "Doctor List",
              icon: ImageConstant.doctor,
              onTap: () {
                context.pushNamed(DoctorListPage.routeName);
              },
            ),
            ModuleWidget(
              lable: "Items Booking",
              icon: ImageConstant.itemBooking,
              onTap: () {
                context.pushNamed(ItemListPage.routeName);
              },
            ),
            ModuleWidget(
              lable: "My Appointments",
              icon: ImageConstant.appointments,
              onTap: () {
                context.pushNamed(MyAppointmentPage.routeName);
              },
            ),
            ModuleWidget(
              lable: "Patients Portal",
              icon: ImageConstant.patientPortal,
              onTap: () {
                context.pushNamed(PatPortalDashboardPage.routeName);
              },
            ),
            ModuleWidget(
              lable: "Doctor Portal",
              icon: ImageConstant.doctorPortal,
              onTap: () {
                var userDetails = context.read<LoggedHisUserCubit>().state;
                if (userDetails != null && userDetails.doctorNo != null) {
                  log(userDetails.doctorNo.toString());
                  context.pushNamed(DoctorDashPage.routeName);
                } else {
                  context.pushNamed(DoctorLoginPage.routeName);
                }
              },
            ),
            ModuleWidget(
              lable: "Career",
              icon: ImageConstant.career,
            ),
            ModuleWidget(
              lable: "Payment",
              icon: ImageConstant.payment,
            ),
            ModuleWidget(
              lable: "Ambulance Service",
              icon: ImageConstant.ambulance,
            ),
            ModuleWidget(
              lable: "Hn Registeration",
              icon: ImageConstant.ambulance,
              onTap: () {
                context.pushNamed(HnRegistrationPage.routeName);
              },
            ),
            ModuleWidget(
              lable: "Settings",
              icon: ImageConstant.settings,
            ),
            ModuleWidget(
              lable: "Profile",
              icon: ImageConstant.profile,
            ),
            ModuleWidget(
              lable: "Management",
              icon: ImageConstant.managementIcon,
              onTap: () {
                var userDetails = context.read<LoggedHisUserCubit>().state;
                if (userDetails != null && userDetails.jobTile == "Admin") {
                  context.pushNamed(ManagementDashboardPage.routeName);
                } else {
                  context.pushNamed(MngLoginPage.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppAuthBloc(getService()),
      child: BlocListener<AppAuthBloc, AppAuthState>(
        listener: (context, state) {
          if (state is AppAuthLoggedOut) {
            context.goNamed(OnBoardingPage.routeName);
          }
        },
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                BlocBuilder<AppAuthBloc, AppAuthState>(
                  builder: (context, state) {
                    if (state is AppAuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return GestureDetector(
                      onTap: () {
                        context.read<AppAuthBloc>().add(AppLogout());
                      },
                      child: Icon(
                        Icons.logout,
                        color: appTheme.white,
                        size: 30,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
