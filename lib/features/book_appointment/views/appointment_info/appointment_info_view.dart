import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/paymode_list_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/paymode_list_response.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/book_appointment/data/models/available_slot_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/patient_type_response.dart';
import 'package:delta_hospital/features/book_appointment/views/appointment_info/bloc/consultation_fee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentInfoView extends StatefulWidget {
  const AppointmentInfoView(
      {super.key,
      required this.patient,
      required this.patientType,
      required this.slot,
      required this.consultationType,
      required this.doctor});
  final HisPatientInfo patient;
  final PatientType patientType;
  final Slot slot;
  final ConsultationType consultationType;
  final Doctor doctor;
  @override
  State<AppointmentInfoView> createState() => _AppointmentInfoViewState();
}

class _AppointmentInfoViewState extends State<AppointmentInfoView> {
  int conFee = 0;
  @override
  void initState() {
    context.read<ConsultationFeeBloc>().add(
          ConsultationFeeGet(
            doctorNo: widget.doctor.doctorNo ?? 0,
            patTypeNo: widget.patientType.patientTypeNo ?? '',
            conTypeNo: widget.consultationType.no ?? '',
          ),
        );
    context.read<PaymodeListBloc>().add(
          PaymodeListGet(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: BlocBuilder<ConsultationFeeBloc, ConsultationFeeState>(
        builder: (context, state) {
          if (state is ConsultationFeeSuccess) {
            conFee = state.fee;
          }
          return Container(
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.doctor.doctorName ?? "",
                              style: lightTextTheme.bodyMedium!.copyWith(),
                            ),
                          ),
                          Text(
                            "$conFee Tk.",
                            style: lightTextTheme.bodyMedium!.copyWith(),
                          )
                        ],
                      ),
                      Text(
                        widget.doctor.docDegree ?? "",
                        style: lightTextTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Appointment Info",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    color: appTheme.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "${DateTime.parse(widget.slot.appointDate ?? "").toFormatedString("dd-MMM-yyyy")} (${DateTime.parse(widget.slot.appointDate ?? "").toFormatedString("EEEE")})",
                              style: lightTextTheme.bodyMedium!.copyWith(
                                color: appTheme.secondary,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Serial",
                                style: lightTextTheme.bodyMedium!.copyWith(
                                  color: appTheme.secondary,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: appTheme.secondary,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    widget.slot.slotSl?.toString() ?? "",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      color: appTheme.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time",
                            style: lightTextTheme.bodyMedium!.copyWith(
                              color: appTheme.secondary,
                            ),
                          ),
                          Text(
                            DateTime.parse(widget.slot.startTime ?? "")
                                .toLocal()
                                .toFormatedString("hh:mm a"),
                            style: lightTextTheme.bodyMedium!.copyWith(
                              color: appTheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Select Payment Method",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    color: appTheme.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<PaymodeListBloc, PaymodeListState>(
                  builder: (context, state) {
                    return CommonDropdownButton<Paymode>(
                      hintText: "Select Payment Method",
                      value: context.watch<VariableStateCubit<Paymode>>().state,
                      onChanged: (value) {
                        if (value != null) {
                          context
                              .read<VariableStateCubit<Paymode>>()
                              .update(value);
                        }
                      },
                      items:
                          state is PaymodeListSuccess ? state.paymodeList : [],
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CommonElevatedButton(
                    lable: "Get Appointment",
                    backgroundColor: appTheme.secondary,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
