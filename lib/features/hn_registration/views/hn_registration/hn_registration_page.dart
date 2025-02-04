import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/app/bloc/pat_relation_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../hn_registration.dart';

class HnRegistrationPage extends StatelessWidget {
  const HnRegistrationPage({super.key});
  static const routeName = 'hn-registration-page';
  static const routePath = 'hn-registration-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PatRelationListBloc(getService())..add(PatRelationListGet()),
        ),
      ],
      child: const HnRegistrationView(),
    );
  }
}
