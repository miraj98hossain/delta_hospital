import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../doctor_opd_portal.dart';

class DoctorOpdPortalPage extends StatelessWidget {
  const DoctorOpdPortalPage({super.key});
  static const routeName = 'doctor-opd-portal-page';
  static const routePath = 'doctor-opd-portal-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VariableStateCubit<DateTime>()..update(DateTime.now()),
      child: const DoctorOpdPortalView(),
    );
  }
}
