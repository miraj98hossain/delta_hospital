import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/management/views/director_portal/bloc/patient_report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../director_portal.dart';

class DirectorPortalPage extends StatelessWidget {
  const DirectorPortalPage({super.key});
  static const String routeName = "director-portal-page";
  static const String routePath = "director-portal-page";
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PatientReportBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<DateTime>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<String>(),
        ),
      ],
      child: const DirectorPortalView(),
    );
  }
}
