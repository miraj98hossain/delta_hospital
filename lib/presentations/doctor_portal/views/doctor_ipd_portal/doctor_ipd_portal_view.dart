import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/app/widgets/session_expire_dialog.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/app_modal.dart';
import 'package:delta_hospital/presentations/doctor_portal/views/doctor_ipd_portal/doctor_ipd_portal_page.dart';
import 'package:delta_hospital/presentations/doctor_portal/views/doctor_opd_portal/bloc/doctor_admitted_patient_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorIpdPortalView extends StatefulWidget {
  const DoctorIpdPortalView({super.key});

  @override
  State<DoctorIpdPortalView> createState() => _DoctorIpdPortalViewState();
}

class _DoctorIpdPortalViewState extends State<DoctorIpdPortalView> {
  late UserDetails _userDetails;
  @override
  void initState() {
    _userDetails = context.read<LoggedHisUserCubit>().state!;

    context.read<DoctorAdmittedPatientBloc>().add(
          GetDoctorAdmittedPatientEvent(doctorNo: _userDetails.doctorNo ?? 0),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: BlocListener<LoggedHisUserCubit, UserDetails?>(
        listener: (context, state) {
          var activePage = GoRouterState.of(context).name.toString();
          if (state == null && activePage == DoctorIpdPortalPage.routeName) {
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
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<DoctorAdmittedPatientBloc,
                    DoctorAdmittedPatientState>(
                  builder: (context, state) {
                    if (state is DoctorAdmittedPatientLaoding) {
                      return const CommonLoading();
                    }
                    if (state is DoctorAdmittedPatientSuccess) {
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemBuilder: (context, index) {
                          var data = state.doctorAdmittedPatientList[index];
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: appTheme.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Admission Id : ",
                                    ),
                                    Text(data.admissionId ?? ""),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Patient Name : ",
                                    ),
                                    Expanded(
                                      child: Text(
                                        data.patientName ?? "",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Gender : ",
                                        ),
                                        Text(
                                          data.genderData ?? "",
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Text(
                                          "Age : ",
                                        ),
                                        Text(
                                          data.age ?? "",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text(
                                      "Bed Name : ",
                                    ),
                                    Text(
                                      data.bedName ?? "",
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text(
                                      "Addmission Date : ",
                                    ),
                                    Text(data.admissionDateTime != null
                                        ? DateTime.parse(
                                                data.admissionDateTime ?? "")
                                            .toFormatedString("dd-MMM-yyyy")
                                        : ""),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: state.doctorAdmittedPatientList.length,
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
