import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../patient_portal_login.dart';

class PatPortalLoginPage extends StatelessWidget {
  const PatPortalLoginPage({super.key});
  static String routeName = 'pat-portal-login';
  static String routePath = 'pat-portal-login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HisAuthBloc(getService()),
      child: const PatPortalLoginView(),
    );
  }
}
