import 'package:delta_hospital/features/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  static const String routeName = "on-boarding-page";
  static const String routePath = "/on-boarding-page";
  @override
  Widget build(BuildContext context) {
    return const OnBoardingView();
  }
}
