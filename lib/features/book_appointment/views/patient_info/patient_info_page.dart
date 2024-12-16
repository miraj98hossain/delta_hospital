import 'package:flutter/material.dart';

import '../../patient_info.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({super.key});
  static const routeName = 'patient-info-page';
  static const routePath = 'patient-info-page';
  @override
  Widget build(BuildContext context) {
    return const PatientInfoView();
  }
}
