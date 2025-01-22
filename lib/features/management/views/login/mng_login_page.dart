import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dashboard_login.dart';

class MngLoginPage extends StatelessWidget {
  const MngLoginPage({super.key});
  static const String routeName = "mng-login-page";
  static const String routePath = "mng-login-page";
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
      child: const MngLoginView(),
    );
  }
}
