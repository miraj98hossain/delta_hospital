import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal/bloc/his_patient_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../patient_portal.dart';

class PatientPortalPage extends StatelessWidget {
  const PatientPortalPage({super.key});
  static const routeName = 'patient-portal-page';
  static const routePath = 'patient-portal-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HisAuthBloc(getService()),
        ),
        BlocProvider(
          create: (context) => HisPatientInfoBloc(getService()),
        ),
      ],
      child: const PatientPortalView(),
    );
  }
}
