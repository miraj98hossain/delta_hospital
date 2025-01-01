import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/doctor_portal/views/doctor_dash/doctor_dash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorDashPage extends StatelessWidget {
  const DoctorDashPage({super.key});
  static const routeName = 'doctor-dash-page';
  static const routePath = '/doctor-dash-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HisAuthBloc(getService()),
      child: const DoctorDashView(),
    );
  }
}
