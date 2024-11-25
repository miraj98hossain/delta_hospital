import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';

class ManagementDashboardView extends StatefulWidget {
  const ManagementDashboardView({super.key});

  @override
  State<ManagementDashboardView> createState() =>
      _ManagementDashboardViewState();
}

class _ManagementDashboardViewState extends State<ManagementDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(),
    );
  }
}
