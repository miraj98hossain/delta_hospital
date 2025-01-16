import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../family_list.dart';

class FamilyListPage extends StatelessWidget {
  const FamilyListPage({super.key});
  static const String routeName = 'family-list-page';
  static const String routePath = 'family-list-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddedPatUserListBloc(getService()),
      child: const FamilyListView(),
    );
  }
}
