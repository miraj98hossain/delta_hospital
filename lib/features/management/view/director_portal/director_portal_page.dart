import 'package:flutter/material.dart';

import '../../director_portal.dart';

class DirectorPortalPage extends StatelessWidget {
  const DirectorPortalPage({super.key});
  static const String routeName = "director-portal-page";
  static const String routePath = "director-portal-page";
  @override
  Widget build(BuildContext context) {
    return const DirectorPortalView();
  }
}
