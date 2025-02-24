import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/doctor_portal/data/models/doctor_shift_list_response.dart';
import 'package:delta_hospital/presentations/doctor_portal/views/doctor_opd_portal/bloc/doctor_consultation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../doctor_opd_portal.dart';

class DoctorOpdPortalPage extends StatelessWidget {
  const DoctorOpdPortalPage({super.key, required this.shiftList});
  static const routeName = 'doctor-opd-portal-page';
  static const routePath = 'doctor-opd-portal-page';
  final List<Shift> shiftList;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DoctorConsultationBloc(getService())),
        BlocProvider(
          create: (context) =>
              VariableStateCubit<DateTime>()..update(DateTime.now()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<int>()..update(0),
        ),
      ],
      child: DoctorOpdPortalView(
        shiftList: shiftList,
      ),
    );
  }
}
