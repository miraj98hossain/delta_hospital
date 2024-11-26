import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class DashboardVerifyOtpView extends StatefulWidget {
  const DashboardVerifyOtpView({super.key});

  @override
  State<DashboardVerifyOtpView> createState() => _DashboardVerifyOtpViewState();
}

class _DashboardVerifyOtpViewState extends State<DashboardVerifyOtpView> {
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
                        "Verification",
                        style: lightTextTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: appTheme.primary,
                        ),
                      ),
                      Text(
                        "An OTP has sent to you phone",
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
                        ImageConstant.verifyOtp,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  "OTP",
                  style: lightTextTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: appTheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: const CommonTextFieldWidget(
                    hintText: "Enter OTP Here",
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
                      "VERIFY",
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
