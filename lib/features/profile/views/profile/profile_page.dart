import 'package:delta_hospital/app/bloc/app_auth_bloc.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const routeName = 'profile-page';
  static const routePath = 'profile-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppAuthBloc(getService()),
      child: const ProfileView(),
    );
  }
}
