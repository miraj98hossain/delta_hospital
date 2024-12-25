import 'package:delta_hospital/features/doctor_portal/views/doctor_dash/doctor_dash_view.dart';
import 'package:flutter/material.dart';

class DoctorDashPage extends StatelessWidget {
  const DoctorDashPage({super.key});
  static const routeName = 'doctor-dash-page';
  static const routePath = '/doctor-dash-page';
  @override
  Widget build(BuildContext context) {
    return const DoctorDashView();
  }
}
