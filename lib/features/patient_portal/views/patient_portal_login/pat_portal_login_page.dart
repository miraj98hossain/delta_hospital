import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../patient_portal_login.dart';

class PatPortalLoginPage extends StatelessWidget {
  const PatPortalLoginPage({super.key, required this.mrn});
  static String routeName = 'pat-portal-login';
  static String routePath = 'pat-portal-login';
  final String mrn;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HisAuthBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<bool>()..update(true),
        ),
      ],
      child: PatPortalLoginView(
        mrn: mrn,
      ),
    );
  }
}
