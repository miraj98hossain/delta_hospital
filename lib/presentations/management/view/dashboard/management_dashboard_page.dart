import 'package:flutter/material.dart';

import '../../management_dashboard.dart';

class ManagementDashboardPage extends StatelessWidget {
  const ManagementDashboardPage({super.key});
  static const String routeName = "management-dash-page";
  static const String routePath = "/management-dash-page";
  @override
  Widget build(BuildContext context) {
    return const ManagementDashboardView();
  }
}
