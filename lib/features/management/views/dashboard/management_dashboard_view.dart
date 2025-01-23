import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/session_expire_dialog.dart';
import 'package:delta_hospital/core/utils/app_modal.dart';

import 'package:delta_hospital/core/utils/image_constant.dart';

import 'package:delta_hospital/features/management/financial_dashboard.dart';
import 'package:delta_hospital/features/management/views/director/director_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocListener<LoggedHisUserCubit, UserDetails?>(
        listener: (context, state) {
          var activePage = GoRouterState.of(context).name.toString();
          if (state == null &&
              activePage == ManagementDashboardPage.routeName) {
            AppModal.showCustomModal(
              context,
              title: "Session Expired",
              content: const SessionExpireDialog(),
            );
          }
        },
        child: Container(
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
                  context.pushNamed(DirectorPage.routeName);
                },
              ),
              MngDashWidget(
                lable: "Financial\nDashboard",
                image: ImageConstant.financialDashboard,
                onTap: () {
                  context.pushNamed(FinancialDashboardPage.routeName);
                },
              ),
              MngDashWidget(
                lable: "Share Holder\nPortal",
                image: ImageConstant.shareHolder,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
