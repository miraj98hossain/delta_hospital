import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/available_slot_response.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/presentations/book_appointment/data/models/patient_type_response.dart';
import 'package:delta_hospital/app/bloc/his_patient_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../patient_info.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage(
      {super.key,
      required this.patientPortalUser,
      required this.patientType,
      required this.slot,
      required this.consultationType,
      required this.doctor});
  static const routeName = 'patient-info-page';
  static const routePath = 'patient-info-page';
  final PatientPortalUser? patientPortalUser;
  final PatientType patientType;
  final Slot slot;
  final ConsultationType consultationType;
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HisPatientInfoBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Gender>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<DateTime>(),
        ),
      ],
      child: PatientInfoView(
        patientPortalUser: patientPortalUser,
        patientType: patientType,
        slot: slot,
        consultationType: consultationType,
        doctor: doctor,
      ),
    );
  }
}
