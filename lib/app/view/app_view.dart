import 'package:delta_hospital/app/cubit/active_page_for_session_dialog_cubit.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/ticker.dart';
import 'package:delta_hospital/core/route/router.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoggedHisUserCubit(getService(), const Ticker()),
        ),
        BlocProvider(
          create: (context) => LoggedAppUserCubit(
            getService(),
          ),
        ),
        BlocProvider(
          create: (context) => ActivePageForSessionDialogCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Delta Hospital',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
