import 'package:flutter/material.dart';

import '../../patient_portal_login.dart';

class PatPortalLoginPage extends StatelessWidget {
  const PatPortalLoginPage({super.key});
  static String routeName = 'pat-portal-login';
  static String routePath = 'pat-portal-login';
  @override
  Widget build(BuildContext context) {
    return const PatPortalLoginView();
  }
}
