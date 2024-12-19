import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/patient_type_response.dart';
import 'package:delta_hospital/features/book_appointment/patient_info.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/consultation_type_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/patient_type_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/widgets/common_drop_down.dart';
import '../../book_appointment.dart';
import 'widgets/week_schedule_widget.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key, required this.doctor});
  final Doctor doctor;
  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  @override
  void initState() {
    context
        .read<PatientTypeBloc>()
        .add(GetPatientTypeEvent(doctorNo: widget.doctor.doctorNo ?? 0));
    super.initState();
  }

  void _getConsultationType() {
    var selectedDate = context.read<VariableStateCubit<DateTime>>().state!;
    var patType = context.read<VariableStateCubit<PatientType>>().state!;

    context.read<ConsultationTypeBloc>().add(GetConsultationTypeEvent(
          doctorNo: widget.doctor.doctorNo ?? 0,
          patTypeNo: patType.patientTypeNo ?? "",
          hospitalNumber: null, // add hospital number later
          appointmentDate: selectedDate.toFormatedString('yyyy-MM-dd'),
        ));
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
                          onChanged: (value) {},
                          items: state is ConsultationTypeSuccess
                              ? state.colsuntationTypeList
                              : [],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Select Patient",
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonDropdownButton(
                hintText: "Select Patient",
                onChanged: (value) {},
                items: List.generate(20, (index) => index),
              ),
              const SizedBox(
                height: 10,
              ),
              const ScheduleWidget(),
              const SizedBox(
                height: 10,
              ),
              const WeekSchedule(),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                color: appTheme.white,
                child: ExpansionTile(
                  title: Text(
                    "Morning",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available Slots",
                              style: lightTextTheme.bodyMedium!.copyWith(
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "20",
                                style: lightTextTheme.bodyMedium!.copyWith(
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
                            itemCount: 50,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisExtent:
                                  MediaQuery.of(context).size.height * 0.05,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: appTheme.lightCyan,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                color: appTheme.white,
                child: ExpansionTile(
                  title: Text(
                    "Evening",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available Slots",
                              style: lightTextTheme.bodyMedium!.copyWith(
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "20",
                                style: lightTextTheme.bodyMedium!.copyWith(
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
                            itemCount: 50,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisExtent:
                                  MediaQuery.of(context).size.height * 0.05,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: appTheme.lightCyan,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonElevatedButton(
                    lable: "Book Appointment",
                    backgroundColor: appTheme.secondary,
                    onPressed: () {
                      context.pushNamed(PatientInfoPage.routeName);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
