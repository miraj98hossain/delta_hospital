import 'package:flutter/material.dart';
import '../my_appointment.dart';

class MyAppointmentPage extends StatelessWidget {
  const MyAppointmentPage({super.key});
  static const routeName = 'my-appointment-page';
  static const routePath = '/my-appointment-page';
  @override
  Widget build(BuildContext context) {
    return const MyAppointmentView();
  }
}
