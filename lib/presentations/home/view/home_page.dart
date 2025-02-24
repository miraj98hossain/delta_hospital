import 'package:delta_hospital/presentations/home/view/home_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "home-page";
  static const String routePath = "/home-page";
  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
