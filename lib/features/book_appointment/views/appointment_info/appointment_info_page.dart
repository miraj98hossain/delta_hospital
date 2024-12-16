import 'package:flutter/material.dart';

import '../../appointment_info.dart';

class AppointmentInfoPage extends StatelessWidget {
  const AppointmentInfoPage({super.key});
  static const routeName = 'appointment-info-page';
  static const routePath = 'appointment-info-page';
  @override
  Widget build(BuildContext context) {
    return const AppointmentInfoView();
  }
}
