import 'package:delta_hospital/app/bloc/paymode_list_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/paymode_list_response.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/available_slot_response.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/patient_type_response.dart';
import 'package:delta_hospital/presentations/book_appointment/views/appointment_info/bloc/book_appointment_bloc.dart';
import 'package:delta_hospital/presentations/book_appointment/views/appointment_info/bloc/consultation_fee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../appointment_info.dart';

class AppointmentInfoPage extends StatelessWidget {
  const AppointmentInfoPage({
    super.key,
    required this.patient,
    required this.patientType,
    required this.slot,
    required this.consultationType,
    required this.doctor,
  });
  static const routeName = 'appointment-info-page';
  static const routePath = 'appointment-info-page';
  final HisPatientInfo patient;
  final PatientType patientType;
  final Slot slot;
  final ConsultationType consultationType;
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConsultationFeeBloc(getService()),
        ),
        BlocProvider(
          create: (context) => PaymodeListBloc(getService()),
        ),
        BlocProvider(
          create: (context) => BookAppointmentBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Paymode>(),
        ),
      ],
      child: AppointmentInfoView(
        patient: patient,
        patientType: patientType,
        slot: slot,
        consultationType: consultationType,
        doctor: doctor,
      ),
    );
  }
}
