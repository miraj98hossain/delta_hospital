import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/core/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_patient.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});
  static const routeName = 'add-patient-page';
  static const routePath = 'add-patient-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VariableStateCubit<Relation>(),
      child: const AddPatientView(),
    );
  }
}
