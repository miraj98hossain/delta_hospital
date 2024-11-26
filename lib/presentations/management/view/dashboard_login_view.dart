import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class DashboardLoginView extends StatefulWidget {
  const DashboardLoginView({super.key});

  @override
  State<DashboardLoginView> createState() => _DashboardLoginViewState();
}

class _DashboardLoginViewState extends State<DashboardLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppbar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            decoration: BoxDecoration(
              color: appTheme.white,
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login",
                        style: lightTextTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: appTheme.primary,
                        ),
                      ),
                      Text(
                        "Please Login to Continue",
                        style: lightTextTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        height: 150,
                        width: 150,
                        ImageConstant.loginImage,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: const CommonTextFieldWidget(
                    hintText: "UserName",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: const CommonTextFieldWidget(
                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In",
                      style: lightTextTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appTheme.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
