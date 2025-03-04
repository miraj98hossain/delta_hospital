import 'package:delta_hospital/app/bloc/look_up_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'career_list_view.dart';

class CareerListPage extends StatelessWidget {
  const CareerListPage({super.key});
  static const routeName = 'career-list-page';
  static const routePath = 'career-list-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LookUpBloc(getService())..add(LookUpGet(lookupNo: 1)),
      child: const CareerListView(),
    );
  }
}
