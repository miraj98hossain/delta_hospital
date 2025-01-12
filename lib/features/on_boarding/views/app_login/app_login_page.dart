import 'package:delta_hospital/app/bloc/app_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/on_boarding/app_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginPage extends StatelessWidget {
  const AppLoginPage({super.key});
  static const routePath = 'app-login-page';
  static const routeName = 'app-login-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppAuthBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<bool>()..update(true),
        ),
      ],
      child: const AppLoginView(),
    );
  }
}
