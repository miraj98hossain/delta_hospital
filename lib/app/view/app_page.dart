import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/cubit/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoggedHisUserCubit(getService()),
      child: const AppView(),
    );
  }
}
