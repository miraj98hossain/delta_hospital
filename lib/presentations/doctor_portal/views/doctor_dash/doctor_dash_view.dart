import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';

import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/session_expire_dialog.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/app_modal.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/presentations/doctor_portal/doctor_dash.dart';
import 'package:delta_hospital/presentations/doctor_portal/views/doctor_dash/bloc/doctor_shift_bloc.dart';
import 'package:delta_hospital/presentations/home/home.dart';
import 'package:delta_hospital/presentations/patient_portal/views/patient_portal_dashboard/widgets/pat_dash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../doctor_ipd_portal.dart';
import '../../doctor_opd_portal.dart';

class DoctorDashView extends StatefulWidget {
  const DoctorDashView({super.key});

  @override
  State<DoctorDashView> createState() => _DoctorDashViewState();
}

class _DoctorDashViewState extends State<DoctorDashView> {
  late UserDetails _userDetails;
  @override
  void initState() {
    context.read<DoctorShiftBloc>().add(GetDoctorShiftEvent());
    _userDetails = context.read<LoggedHisUserCubit>().state!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<HisAuthBloc, HisAuthState>(
            listener: (context, state) {
              if (state is HisAuthLoggedOut) {
                context.read<LoggedHisUserCubit>().resetState();
                context.goNamed(HomePage.routeName);
              }
            },
          ),
          BlocListener<LoggedHisUserCubit, UserDetails?>(
            listener: (context, state) {
              var activePage = GoRouterState.of(context).name.toString();

              if (state == null && activePage == DoctorDashPage.routeName) {
                AppModal.showCustomModal(
                  context,
                  title: "Session Expired",
                  content: const SessionExpireDialog(),
                );
              }
            },
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userDetails.firstName ?? "",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _userDetails.jobTile ?? "",
                      style: lightTextTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  Expanded(
                    child: PatDashWidget(
                      lable: "OPD Portal",
                      image: ImageConstant.doctorVisit,
                      onTap: () {
                        var shiftState = context.read<DoctorShiftBloc>().state;
                        if (shiftState is DoctorShiftSuccess) {
                          context.pushNamed(DoctorOpdPortalPage.routeName,
                              extra: {"shiftList": shiftState.doctorShiftList});
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: PatDashWidget(
                      lable: "IPD Portal",
                      image: ImageConstant.hospital,
                      onTap: () {
                        context.pushNamed(DoctorIpdPortalPage.routeName);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              CommonElevatedButton(
                lable: "Logout",
                backgroundColor: Colors.red,
                onPressed: () {
                  context.read<HisAuthBloc>().add(HisLogout());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
