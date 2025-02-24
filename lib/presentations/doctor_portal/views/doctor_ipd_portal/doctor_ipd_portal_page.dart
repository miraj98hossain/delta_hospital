import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/doctor_portal/views/doctor_opd_portal/bloc/doctor_admitted_patient_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../doctor_ipd_portal.dart';

class DoctorIpdPortalPage extends StatelessWidget {
  const DoctorIpdPortalPage({super.key});
  static const routeName = 'doctor-ipd-portal-page';
  static const routePath = 'doctor-ipd-portal-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorAdmittedPatientBloc(getService()),
        ),
      ],
      child: const DoctorIpdPortalView(),
    );
  }
}
