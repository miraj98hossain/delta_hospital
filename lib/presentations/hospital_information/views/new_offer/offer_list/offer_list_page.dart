import 'package:delta_hospital/app/bloc/look_up_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../new_offer_list.dart';

class OfferListPage extends StatelessWidget {
  const OfferListPage({super.key});
  static const routeName = 'offer-list-page';
  static const routePath = 'offer-list-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LookUpBloc(getService())..add(LookUpGet(lookupNo: 3)),
      child: const OfferListView(),
    );
  }
}
