import 'package:flutter/material.dart';

import '../../dashboard_login.dart';

class DashboardLoginPage extends StatelessWidget {
  const DashboardLoginPage({super.key});
  static const String routeName = "dash-login-page";
  static const String routePath = "dash-login-page";
  @override
  Widget build(BuildContext context) {
    return const DashboardLoginView();
  }
}
