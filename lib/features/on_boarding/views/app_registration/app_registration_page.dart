import 'package:delta_hospital/app/bloc/app_reg_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_registration.dart';

class AppRegistrationPage extends StatelessWidget {
  const AppRegistrationPage({super.key});
  static String routePath = 'app-registration-page';
  static String routeName = 'app-registration-page';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppRegBloc(getService())),
        BlocProvider(
          create: (context) => VariableStateCubit<DateTime>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Gender>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<bool>()..update(true),
        ),
      ],
      child: const AppRegistrationView(),
    );
  }
}
