import 'package:flutter/material.dart';

import '../../director.dart';

class DirectorPage extends StatelessWidget {
  const DirectorPage({super.key});
  static const String routeName = "director-page";
  static const String routePath = "director-page";
  @override
  Widget build(BuildContext context) {
    return const DirectorView();
  }
}
