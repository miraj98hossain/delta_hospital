import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/auth/app_registration.dart';
import 'package:delta_hospital/features/auth/view/app_login/app_login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.88,
            decoration: BoxDecoration(
              color: appTheme.white,
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35 +
                      MediaQuery.of(context).viewPadding.top,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appTheme.skyBlue,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).viewPadding.top,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Image.asset(
                        height: 180,
                        width: 353,
                        ImageConstant.directorPortal,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Column(
                  children: [
                    Text(
                      "Delta Hospital",
                      style: lightTextTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: appTheme.primary,
                      ),
                    ),
                    Text(
                      "Please Sign In/Sign Up to Continue",
                      style: lightTextTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pushNamed(AppLoginPage.routeName);
                        },
                        child: Text(
                          "Sign In",
                          style: lightTextTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: appTheme.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pushNamed(AppRegistrationPage.routeName);
                        },
                        child: Text(
                          "Sign Up",
                          style: lightTextTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: appTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
