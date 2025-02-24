import 'package:delta_hospital/presentations/splash/splash.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String routeName = "splash-page";
  static const String routePath = "/splash-page";
  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}
