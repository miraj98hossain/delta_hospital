import 'package:delta_hospital/app/widgets/common_appbar.dart';

import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/presentations/management/dashboard_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../management_dashboard.dart';

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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 175,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          children: [
            MngDashWidget(
              lable: "Director\nPortal",
              image: ImageConstant.directorPortal,
              onTap: () {
                context.pushNamed(DashboardLoginPage.routeName);
              },
            ),
            MngDashWidget(
              lable: "Financial\nDashboard",
              image: ImageConstant.financialDashboard,
              onTap: () {},
            ),
            MngDashWidget(
              lable: "Share Holder\nPortal",
              image: ImageConstant.shareHolder,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
