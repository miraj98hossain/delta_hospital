import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_view.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});
  static const routePath = 'payment-page';
  static const routeName = 'payment-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VariableStateCubit<PatientPortalUser>(),
        ),
        BlocProvider(
          create: (context) =>
              VariableStateCubit<SegButton>()..update(SegButton.all),
        ),
        BlocProvider(
          create: (context) => AddedPatUserListBloc(getService()),
        ),
      ],
      child: const PaymentView(),
    );
  }
}
