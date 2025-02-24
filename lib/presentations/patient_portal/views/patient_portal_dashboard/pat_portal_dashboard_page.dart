import 'package:flutter/material.dart';
import '../../patient_portal_dashboard.dart';

class PatPortalDashboardPage extends StatelessWidget {
  const PatPortalDashboardPage({super.key});
  static const routeName = 'pat-portal-dashboard';
  static const routePath = 'pat-portal-dashboard';
  @override
  Widget build(BuildContext context) {
    return const PatPortalDashboardView();
  }
}
