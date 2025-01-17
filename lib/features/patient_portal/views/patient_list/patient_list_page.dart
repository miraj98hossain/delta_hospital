import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../patient_list.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({super.key});
  static const String routeName = 'patient-list-page';
  static const String routePath = 'patient-list-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddedPatUserListBloc(getService()),
        ),
      ],
      child: const PatientListView(),
    );
  }
}
