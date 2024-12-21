import 'package:delta_hospital/features/patient_portal/views/patient_portal_login/pat_portal_login_view.dart';
import 'package:flutter/material.dart';

class PatPortalLoginPage extends StatelessWidget {
  const PatPortalLoginPage({super.key});
  static String routeName = 'pat-portal-login';
  static String routePath = 'pat-portal-login';
  @override
  Widget build(BuildContext context) {
    return const PatPortalLoginView();
  }
}
