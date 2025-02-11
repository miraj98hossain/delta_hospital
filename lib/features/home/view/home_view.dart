import 'dart:developer';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_drawer.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/career/views/career_list/career_list_page.dart';
import 'package:delta_hospital/features/doctor_portal/doctor_dash.dart';
import 'package:delta_hospital/features/hn_registration/views/hn_registration/hn_registration_page.dart';
import 'package:delta_hospital/features/management/views/dashboard/management_dashboard_page.dart';
import 'package:delta_hospital/features/management/views/login/mng_login_page.dart';
import 'package:delta_hospital/features/my_appointments/my_appointment.dart';
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
            ModuleWidget(
              lable: "Career",
              icon: ImageConstant.career,
              onTap: () {
                context.pushNamed(CareerListPage.routeName);
              },
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
            // ModuleWidget(
            //   lable: "Settings",
            //   icon: ImageConstant.settings,
            // ),
            // ModuleWidget(
            //   lable: "Profile",
            //   icon: ImageConstant.profile,
            // ),
          ],
        ),
      ),
    );
  }
}
