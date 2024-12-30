import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/patient_portal/views/family_list/family_list_page.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal/patient_portal_page.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal_login/pat_portal_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/pat_dash_widget.dart';

class PatPortalDashboardView extends StatefulWidget {
  const PatPortalDashboardView({super.key});

  @override
  State<PatPortalDashboardView> createState() => _PatPortalDashboardViewState();
}

class _PatPortalDashboardViewState extends State<PatPortalDashboardView> {
  late UserDetails? _loggedHisUser;
  @override
  void initState() {
    _loggedHisUser = context.read<LoggedHisUserCubit>().state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Row(
              children: [
                Expanded(
                  child: PatDashWidget(
                    lable: "Self Portal",
                    image: ImageConstant.selfPortal,
                    onTap: () {
                      if (_loggedHisUser != null &&
                          _loggedHisUser!.jobTile == "Patient") {
                        context.pushNamed(PatientPortalPage.routeName);
                      } else {
                        context.pushNamed(PatPortalLoginPage.routeName);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: PatDashWidget(
                    lable: "Family Portal",
                    image: ImageConstant.familyPortal,
                    onTap: () {
                      context.pushNamed(FamilyListPage.routeName);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
