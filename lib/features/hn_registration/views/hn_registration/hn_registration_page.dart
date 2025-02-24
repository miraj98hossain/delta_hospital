import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/app/bloc/pat_relation_list_bloc.dart';
import 'package:delta_hospital/features/hn_registration/views/hn_registration/bloc/hn_reg_fee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../hn_registration.dart';

class HnRegistrationPage extends StatelessWidget {
  const HnRegistrationPage({super.key});
  static const routeName = 'hn-registration-page';
  static const routePath = 'hn-registration-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PatRelationListBloc(getService())..add(PatRelationListGet()),
        ),
        BlocProvider(
          create: (context) => HnRegFeeBloc(getService())..add(HnRegFeeGet()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<PatientRelation>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Gender>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<BloodGroup>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<int>()..update(0),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<DateTime>(),
        ),
      ],
      child: const HnRegistrationView(),
    );
  }
}
