import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/presentations/home/home.dart';
import 'package:delta_hospital/presentations/on_boarding/on_boarding.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<LoggedHisUserCubit>().checkLoggedUser();
    context.read<LoggedAppUserCubit>().checkLoggedAppUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoggedAppUserCubit, AppUserDetails?>(
        listener: (context, state) {
          if (state != null) {
            context.goNamed(HomePage.routeName);
          } else {
            context.goNamed(OnBoardingPage.routeName);
          }
        },
        child: Center(
          child: Image.asset(
            height: 100,
            ImageConstant.companyLogo,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
