import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SessionExpireDialog extends StatelessWidget {
  const SessionExpireDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HisAuthBloc(getService()),
      child: BlocListener<HisAuthBloc, HisAuthState>(
        listener: (context, state) {
          if (state is HisAuthLoggedOut) {
            context.read<LoggedHisUserCubit>().resetState();
            // context.pop();
            context.goNamed(HomePage.routeName);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImageConstant.risk, height: 50, width: 50),
              const SizedBox(
                height: 10,
              ),
              Text("Session Expired", style: lightTextTheme.bodyMedium),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<HisAuthBloc, HisAuthState>(
                builder: (context, state) {
                  return CommonElevatedButton(
                    lable: state is HisAuthLoading
                        ? "Logging Out..."
                        : "Login Again",
                    backgroundColor: Colors.red,
                    onPressed: () {
                      context.read<HisAuthBloc>().add(HisLogout());
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
