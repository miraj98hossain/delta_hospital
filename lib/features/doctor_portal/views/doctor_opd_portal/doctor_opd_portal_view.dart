import 'package:delta_hospital/app/app.dart';

import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/app/widgets/session_expire_dialog.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/app_modal.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_consultaion_gridlist_response.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_shift_list_response.dart';
import 'package:delta_hospital/features/doctor_portal/doctor_opd_portal.dart';
import 'package:delta_hospital/features/doctor_portal/views/doctor_opd_portal/bloc/doctor_consultation_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorOpdPortalView extends StatefulWidget {
  const DoctorOpdPortalView({super.key, required this.shiftList});
  final List<Shift> shiftList;
  @override
  State<DoctorOpdPortalView> createState() => _DoctorOpdPortalViewState();
}

class _DoctorOpdPortalViewState extends State<DoctorOpdPortalView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late UserDetails _userDetails;
  late DateTime _selectedDate;
  @override
  void initState() {
    _userDetails = context.read<LoggedHisUserCubit>().state!;
    _selectedDate = context.read<VariableStateCubit<DateTime>>().state!;

    _tabController =
        TabController(length: widget.shiftList.length, vsync: this);
    context.read<DoctorConsultationBloc>().add(GetDoctorConsultationEvent(
          doctorNo: _userDetails.doctorNo ?? 0,
          shiftdtlNo: widget.shiftList[_tabController.index].shiftNo ?? 0,
          fromDate: _selectedDate.toFormatedString('dd-MMM-yyyy'),
        ));
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<VariableStateCubit<int>>().update(_tabController.index);
        _selectedDate = context.read<VariableStateCubit<DateTime>>().state!;
        context.read<DoctorConsultationBloc>().add(GetDoctorConsultationEvent(
              doctorNo: _userDetails.doctorNo ?? 0,
              shiftdtlNo: widget.shiftList[_tabController.index].shiftNo ?? 0,
              fromDate: _selectedDate.toFormatedString('dd-MMM-yyyy'),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: BlocListener<LoggedHisUserCubit, UserDetails?>(
        listener: (context, state) {
          var activePage = GoRouterState.of(context).name.toString();
          if (state == null && activePage == DoctorOpdPortalPage.routeName) {
            AppModal.showCustomModal(
              context,
              title: "Session Expired",
              content: const SessionExpireDialog(),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  color: appTheme.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: appTheme.secondary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Appointment Date",
                            style: lightTextTheme.bodyMedium!.copyWith(
                              color: appTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            BlocBuilder<VariableStateCubit<DateTime>,
                                DateTime?>(
                              builder: (context, state) {
                                return Text(
                                  context
                                          .watch<VariableStateCubit<DateTime>>()
                                          .state
                                          ?.toFormatedString("dd-MMM-yyyy") ??
                                      "",
                                  style: lightTextTheme.bodyMedium!.copyWith(
                                    color: appTheme.primary,
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () async {
                                var date = context
                                    .read<VariableStateCubit<DateTime>>()
                                    .state;
                                var selectedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 30)),
                                  initialDate: date,
                                );
                                if (selectedDate != null && context.mounted) {
                                  context
                                      .read<VariableStateCubit<DateTime>>()
                                      .update(selectedDate);
                                  context
                                      .read<DoctorConsultationBloc>()
                                      .add(GetDoctorConsultationEvent(
                                        doctorNo: _userDetails.doctorNo ?? 0,
                                        shiftdtlNo: widget
                                                .shiftList[_tabController.index]
                                                .shiftNo ??
                                            0,
                                        fromDate: selectedDate
                                            .toFormatedString('dd-MMM-yyyy'),
                                      ));
                                }
                              },
                              icon: Icon(
                                size: 20,
                                color: appTheme.primary,
                                Icons.calendar_today_outlined,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const BoxDecoration(),
                  tabs: [
                    ...List.generate(widget.shiftList.length, (index) {
                      var shift = widget.shiftList[index];
                      return Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: index ==
                                    context
                                        .watch<VariableStateCubit<int>>()
                                        .state!
                                ? appTheme.deltaBlue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              shift.shiftTime != null
                                  ? shift.shiftTime!
                                      .replaceAll(
                                        RegExp(
                                          r'\([^)]*\)',
                                        ),
                                        "",
                                      )
                                      .trim()
                                  : "",
                              style: lightTextTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: index ==
                                        context
                                            .watch<VariableStateCubit<int>>()
                                            .state!
                                    ? appTheme.white
                                    : appTheme.darkPurple,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ...List.generate(widget.shiftList.length, (index) {
                      return Column(
                        children: [
                          Expanded(
                            child: BlocBuilder<DoctorConsultationBloc,
                                DoctorConsultationState>(
                              builder: (context, state) {
                                if (state is DoctorConsultationLaoding) {
                                  return const CommonLoading();
                                }
                                if (state is DoctorConsultationSuccess) {
                                  return ListView.separated(
                                    itemCount:
                                        state.doctorConsultationList.length,
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      var consultation =
                                          state.doctorConsultationList[index];
                                      return ConsultationWidget(
                                          consultation: consultation);
                                    },
                                  );
                                }
                                return Container();
                              },
                            ),
                          )
                        ],
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConsultationWidget extends StatelessWidget {
  const ConsultationWidget({
    super.key,
    required this.consultation,
  });

  final Consultation consultation;
  Color _getReportStatusColor() {
    if (consultation.prescriptionNo == null) {
      return Colors.yellow.shade700;
    } else {
      return Colors.green;
    }
  }

  String _getReportStatus() {
    if (consultation.prescriptionNo == null) {
      return "Pending";
    } else {
      return "Done";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white,
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: _getReportStatusColor(),
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            _getReportStatus(),
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: appTheme.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(consultation.patientName ?? ""),
                                      Text(
                                        "Age: ${consultation.age}",
                                        style: lightTextTheme.bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: appTheme.secondary),
                                      ),
                                      Text(
                                        consultation.consultTypeDesc ?? "",
                                        style: lightTextTheme.bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: appTheme.secondary,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          consultation.slotSl.toString(),
                          style: lightTextTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: appTheme.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
