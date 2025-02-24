import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/management/views/financial_dashboard/bloc/financial_report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../financial_dashboard.dart';

class FinancialDashboardPage extends StatelessWidget {
  const FinancialDashboardPage({super.key});
  static const String routeName = "financial-dashboard-page";
  static const String routePath = "financial-dashboard-page";
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FinancialReportBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<DateTime>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<String>(),
        ),
      ],
      child: const FinancialDashboardView(),
    );
  }
}
