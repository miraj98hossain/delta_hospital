import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/management/view/dashboard/management_dashboard_page.dart';
import 'package:delta_hospital/features/my_appointments/my_appointment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../book_appointment/views/doctor_list/doctor_list_page.dart';
import '../../items_booking/views/item_list/item_list_page.dart';
import '../home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
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
                context.pushNamed(ManagementDashboardPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
