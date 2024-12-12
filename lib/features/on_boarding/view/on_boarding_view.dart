import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Image.asset(
              height: 100,
              width: double.infinity,
              ImageConstant.companyLogo,
            ),
            Text(
              "Welcome To",
              style: lightTextTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: appTheme.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
