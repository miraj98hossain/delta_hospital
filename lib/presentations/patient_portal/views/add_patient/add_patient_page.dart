import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';

import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/patient_portal/views/add_patient/bloc/his_user_create_bloc.dart';
import 'package:delta_hospital/app/bloc/pat_relation_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_patient.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});
  static const routeName = 'add-patient-page';
  static const routePath = 'add-patient-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VariableStateCubit<PatientRelation>(),
        ),
        BlocProvider(
          create: (context) => HisUserCreateBloc(getService()),
        ),
        BlocProvider(
          create: (context) => PatRelationListBloc(getService()),
        ),
      ],
      child: const AddPatientView(),
    );
  }
}
