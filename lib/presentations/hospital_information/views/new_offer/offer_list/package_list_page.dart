import 'package:delta_hospital/app/bloc/look_up_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'offer_list_view.dart';

class PackageListPage extends StatelessWidget {
  const PackageListPage({super.key});
  static const routeName = 'package-list-page';
  static const routePath = 'package-list-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LookUpBloc(getService())..add(LookUpGet(lookupNo: 9)),
      child: const OfferListView(),
    );
  }
}
