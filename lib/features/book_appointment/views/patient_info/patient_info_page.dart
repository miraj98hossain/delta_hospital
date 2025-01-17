import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../patient_info.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({super.key});
  static const routeName = 'patient-info-page';
  static const routePath = 'patient-info-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VariableStateCubit<Gender>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<DateTime>(),
        ),
      ],
      child: const PatientInfoView(),
    );
  }
}
