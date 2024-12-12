import 'package:flutter/material.dart';

import '../../app_registration.dart';

class AppRegistrationPage extends StatelessWidget {
  const AppRegistrationPage({super.key});
  static String routePath = '/app-registration-page';
  static String routeName = 'app-registration-page';

  @override
  Widget build(BuildContext context) {
    return const AppRegistrationView();
  }
}
