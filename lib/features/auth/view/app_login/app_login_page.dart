import 'package:delta_hospital/features/auth/app_login.dart';
import 'package:flutter/material.dart';

class AppLoginPage extends StatelessWidget {
  const AppLoginPage({super.key});
  static const routePath = '/app-login-page';
  static const routeName = 'app-login-page';
  @override
  Widget build(BuildContext context) {
    return const AppLoginView();
  }
}
