import 'package:flutter/material.dart';

import '../../financial_dashboard.dart';

class FinancialDashboardPage extends StatelessWidget {
  const FinancialDashboardPage({super.key});
  static const String routeName = "financial-dashboard-page";
  static const String routePath = "financial-dashboard-page";
  @override
  Widget build(BuildContext context) {
    return const FinancialDashboardView();
  }
}
