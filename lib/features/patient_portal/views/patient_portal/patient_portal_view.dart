import 'dart:developer';

import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/active_page_for_session_dialog_cubit.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/app_modal.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/patient_portal/pat_notes.dart';
import 'package:delta_hospital/features/patient_portal/pat_prescription.dart';
import 'package:delta_hospital/features/patient_portal/patient_portal.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal/bloc/his_patient_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../pat_medical_record.dart';
import '../../patient_portal_dashboard.dart';

class PatientPortalView extends StatefulWidget {
  const PatientPortalView({super.key});

  @override
  State<PatientPortalView> createState() => _PatientPortalViewState();
}

class _PatientPortalViewState extends State<PatientPortalView> {
  @override
  void initState() {
    context.read<HisPatientInfoBloc>().add(GetHisPatientInfoEvent());
    context
        .read<ActivePageForSessionDialogCubit>()
        .changeActivePage(PatientPortalPage.routeName);
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

                context.goNamed(PatPortalDashboardPage.routeName);
              }
            },
          ),
          BlocListener<LoggedHisUserCubit, UserDetails?>(
            listener: (context, state) {
              var activePage =
                  context.read<ActivePageForSessionDialogCubit>().state;
              if (state == null && activePage == PatientPortalPage.routeName) {
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
                child: BlocBuilder<HisPatientInfoBloc, HisPatientInfoState>(
                  builder: (context, state) {
                    if (state is HisPatientInfoLoading) {
                      return const CommonLoading();
                    }
                    if (state is HisPatientInfoSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Patient Name"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(state.hisPatientInfo.patientName ?? ""),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Hospital Id"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(state.hisPatientInfo.hospitalNumber ?? ""),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Age"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(state.hisPatientInfo.age ?? ""),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Gender"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(state.hisPatientInfo.genderData ?? ""),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.085,
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.12,
                ),
                children: [
                  PatPortalGridWidget(
                    lable: "Medical Record",
                    image: ImageConstant.medicalRecord,
                    onTap: () {
                      context.pushNamed(PatMedicalRecordPage.routeName);
                    },
                  ),
                  PatPortalGridWidget(
                    lable: "Prescription",
                    image: ImageConstant.prescription,
                    onTap: () {
                      context.pushNamed(PatPrescriptionPage.routeName);
                    },
                  ),
                  PatPortalGridWidget(
                    lable: "Invoice",
                    image: ImageConstant.invoice,
                    onTap: () {},
                  ),
                  PatPortalGridWidget(
                    lable: "Notes",
                    image: ImageConstant.stickyNotes,
                    onTap: () {
                      context.pushNamed(PatNotesPage.routeName);
                    },
                  )
                ],
              ),
              BlocBuilder<HisAuthBloc, HisAuthState>(
                builder: (context, state) {
                  return CommonElevatedButton(
                    lable:
                        state is HisAuthLoading ? "Logging Out..." : "Logout",
                    backgroundColor: Colors.red,
                    onPressed: () {
                      context.read<HisAuthBloc>().add(HisLogout());
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SessionExpireDialog extends StatelessWidget {
  const SessionExpireDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HisAuthBloc(getService()),
      child: BlocListener<HisAuthBloc, HisAuthState>(
        listener: (context, state) {
          if (state is HisAuthLoggedOut) {
            context.read<LoggedHisUserCubit>().resetState();
            // context.pop();
            context.goNamed(PatPortalDashboardPage.routeName);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImageConstant.risk, height: 50, width: 50),
              const SizedBox(
                height: 10,
              ),
              Text("Session Expired", style: lightTextTheme.bodyMedium),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<HisAuthBloc, HisAuthState>(
                builder: (context, state) {
                  return CommonElevatedButton(
                    lable: state is HisAuthLoading
                        ? "Logging Out..."
                        : "Login Again",
                    backgroundColor: Colors.red,
                    onPressed: () {
                      context.read<HisAuthBloc>().add(HisLogout());
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PatPortalGridWidget extends StatelessWidget {
  const PatPortalGridWidget({
    super.key,
    required this.lable,
    required this.image,
    this.onTap,
  });
  final String lable;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                height: 50,
                width: 50,
                image,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                lable,
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
