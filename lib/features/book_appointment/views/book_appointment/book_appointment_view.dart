import 'package:collection/collection.dart';
import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/patient_type_response.dart';
import 'package:delta_hospital/features/book_appointment/patient_info.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/consultation_type_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/patient_type_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/slot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/widgets/app_snack_bar.dart';
import '../../../../app/widgets/common_drop_down.dart';
import '../../../../dependency_injector/di_container.dart';
import '../../book_appointment.dart';
import '../../data/models/available_slot_response.dart';
import '../../domain/repositories/book_apt_repository.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key, required this.doctor});
  final Doctor doctor;
  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  late AppUserDetails loggedAppUser;
  @override
  void initState() {
    loggedAppUser = context.read<LoggedAppUserCubit>().state!;
    context
        .read<PatientTypeBloc>()
        .add(GetPatientTypeEvent(doctorNo: widget.doctor.doctorNo ?? 0));
    _getAvailableSlot();
    super.initState();
  }

  void _getConsultationType() {
    var selectedDate = context.read<VariableStateCubit<DateTime>>().state!;
    var patType = context.read<VariableStateCubit<PatientType>>().state;

    if (patType == null) return;
    context.read<VariableStateCubit<ConsultationType>>().reset();
    context.read<ConsultationTypeBloc>().add(GetConsultationTypeEvent(
          doctorNo: widget.doctor.doctorNo ?? 0,
          patTypeNo: patType.patientTypeNo ?? "",
          hospitalNumber: null, // add hospital number later
          appointmentDate: selectedDate.toFormatedString('yyyy-MM-dd'),
        ));
  }

  void _getAvailableSlot() {
    var selectedDate = context.read<VariableStateCubit<DateTime>>().state!;
    context.read<SlotBloc>().add(
          GetSlotEvent(
            doctorNo: widget.doctor.doctorNo ?? 0,
            appointmentDate: selectedDate.toFormatedString('yyyy-MM-dd'),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: appTheme.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.doctor.doctorName ?? "",
                                style: lightTextTheme.bodyMedium!.copyWith(),
                              ),
                              Text(
                                widget.doctor.docDegree ?? "",
                                style: lightTextTheme.bodySmall!.copyWith(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Choose Type",
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<PatientTypeBloc, PatientTypeState>(
                      builder: (context, state) {
                        return CommonDropdownButton<PatientType>(
                          hintText: "Patient Type",
                          onChanged: (value) {
                            if (value != null) {
                              context
                                  .read<VariableStateCubit<PatientType>>()
                                  .update(value);
                              _getConsultationType();
                              if (value.patientTypeNo == '2') {
                                context
                                    .read<
                                        VariableStateCubit<PatientPortalUser>>()
                                    .reset();
                                context
                                    .read<AddedPatUserListBloc>()
                                    .add(GetAddedPatUserListEvent(
                                      refId: loggedAppUser.phone ?? '0',
                                    ));
                              }
                            }
                          },
                          items: state is PatientTypeSuccess
                              ? state.patTypeList
                              : [],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BlocBuilder<ConsultationTypeBloc,
                        ConsultationTypeState>(
                      builder: (context, state) {
                        return CommonDropdownButton<ConsultationType>(
                          hintText: "Consultation Type",
                          value: context
                              .watch<VariableStateCubit<ConsultationType>>()
                              .state,
                          onChanged: (value) {
                            if (value != null) {
                              context
                                  .read<VariableStateCubit<ConsultationType>>()
                                  .update(value);
                            }
                          },
                          items: state is ConsultationTypeSuccess
                              ? state.colsuntationTypeList
                              : [],
                        );
                      },
                    ),
                  ),
                ],
              ),
              BlocBuilder<VariableStateCubit<PatientType>, PatientType?>(
                builder: (context, state) {
                  if (state?.patientTypeNo == '2') {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          "Select Patient",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appTheme.white,
                          ),
                        ),
                        SizedBox(
                          child: BlocBuilder<AddedPatUserListBloc,
                              AddedPatUserListState>(
                            builder: (context, state) {
                              return CommonDropdownButton<PatientPortalUser>(
                                hintText: "Select Patient",
                                // validator: (value) {
                                //   if (value == null) {
                                //     return "Please select patient";
                                //   }
                                //   return null;
                                // },
                                value: context
                                    .watch<
                                        VariableStateCubit<PatientPortalUser>>()
                                    .state,
                                onChanged: (value) {
                                  if (value != null) {
                                    context
                                        .read<
                                            VariableStateCubit<
                                                PatientPortalUser>>()
                                        .update(value);
                                  }
                                },
                                items: state is AddedPatUserListSuccess
                                    ? state.patientPortalUserList
                                    : [],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ScheduleWidget(
                getConsultationType: _getConsultationType,
                getAvailableSlot: _getAvailableSlot,
              ),
              const SizedBox(
                height: 10,
              ),
              WeekSchedule(
                getConsultationType: _getConsultationType,
                getAvailableSlot: _getAvailableSlot,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<SlotBloc, SlotState>(
                builder: (context, state) {
                  if (state is SlotLoading) {
                    return const CommonLoading();
                  }
                  if (state is SlotSuccess) {
                    var groupedSlot =
                        groupBy(state.availableSlotList, (slot) => slot.shift);
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        List<Slot> slotList =
                            groupedSlot.values.elementAt(index);
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          color: appTheme.white,
                          child: ExpansionTile(
                            title: Text(
                              groupedSlot.keys.elementAt(index) ?? "",
                              style: lightTextTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            childrenPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Available Slots",
                                        style:
                                            lightTextTheme.bodyMedium!.copyWith(
                                          color: appTheme.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appTheme.primary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          slotList.length.toString(),
                                          style: lightTextTheme.bodyMedium!
                                              .copyWith(
                                            color: appTheme.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Divider(
                                    thickness: 1,
                                    color: appTheme.lightCyan,
                                    indent: 0,
                                    endIndent: 0,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    height: 200,
                                    child: GridView.builder(
                                      itemCount: slotList.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 3,
                                        mainAxisExtent:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                      itemBuilder: (context, index) {
                                        Slot slot = slotList[index];
                                        return SlotTime(
                                          slot: slot,
                                          isSlected: context
                                                  .watch<
                                                      VariableStateCubit<
                                                          Slot>>()
                                                  .state ==
                                              slot,
                                          onSelected: (slot) async {
                                            var result = await getService<
                                                    BookAptRepository>()
                                                .checkSlotStatus(
                                              slotNo: slot.slotNo!,
                                            );
                                            if (context.mounted) {
                                              if (result.actionFlag == "1") {
                                                context
                                                    .read<
                                                        VariableStateCubit<
                                                            Slot>>()
                                                    .update(slot);
                                              } else {
                                                AppSnackBar.showSnackBar(
                                                  context: context,
                                                  message: result.status ?? "",
                                                  type: SnackBarType.error,
                                                );
                                              }
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: groupedSlot.length,
                    );
                  }
                  return Container();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonElevatedButton(
                    lable: "Book Appointment",
                    backgroundColor: appTheme.secondary,
                    onPressed: () {
                      if (_validate()) {
                        context.pushNamed(
                          PatientInfoPage.routeName,
                          extra: {
                            "slot":
                                context.read<VariableStateCubit<Slot>>().state,
                            "consultationType": context
                                .read<VariableStateCubit<ConsultationType>>()
                                .state,
                            "patType": context
                                .read<VariableStateCubit<PatientType>>()
                                .state,
                            "doctor": widget.doctor,
                            "patient": context
                                .read<VariableStateCubit<PatientPortalUser>>()
                                .state
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).viewPadding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _validate() {
    var selectedPatType = context.read<VariableStateCubit<PatientType>>().state;
    var selectedSlot = context.read<VariableStateCubit<Slot>>().state;
    var selectedPatient =
        context.read<VariableStateCubit<PatientPortalUser>>().state;
    var selectedConsultationType =
        context.read<VariableStateCubit<ConsultationType>>().state;

    if (selectedPatType == null) {
      AppSnackBar.showSnackBar(
        context: context,
        message: "Please select patient type",
        type: SnackBarType.warning,
      );
      return false;
    }
    if (selectedConsultationType == null) {
      AppSnackBar.showSnackBar(
        context: context,
        message: "Please select consultation type",
        type: SnackBarType.warning,
      );
      return false;
    }
    if (selectedPatType.patientTypeNo == "2" && selectedPatient == null) {
      AppSnackBar.showSnackBar(
        context: context,
        message: "Please select patient",
        type: SnackBarType.warning,
      );
      return false;
    }
    if (selectedSlot == null) {
      AppSnackBar.showSnackBar(
        context: context,
        message: "Please select slot",
        type: SnackBarType.warning,
      );
      return false;
    }

    return true;
  }
}
