import 'package:flutter/material.dart';
import '../../patient_portal.dart';

class PatientPortalPage extends StatelessWidget {
  const PatientPortalPage({super.key});
  static const routeName = 'patient-portal-page';
  static const routePath = 'patient-portal-page';
  @override
  Widget build(BuildContext context) {
    return const PatientPortalView();
  }
}
