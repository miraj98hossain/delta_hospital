import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/presentations/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => context.pushNamed(HomePage.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          height: 100,
          ImageConstant.companyLogo,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
