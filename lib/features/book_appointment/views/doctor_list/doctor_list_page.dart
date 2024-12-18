import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_sepcialization_list_response.dart';
import 'package:delta_hospital/features/book_appointment/views/doctor_list/bloc/department_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/doctor_list/bloc/specialization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../doctor_list.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});
  static const routeName = 'doctor-list-page';
  static const routePath = '/doctor-list-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DepartmentBloc(getService()),
        ),
        BlocProvider(
          create: (context) => SpecializationBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Department>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Specialization>(),
        ),
      ],
      child: const DoctorListView(),
    );
  }
}
