import 'package:flutter/material.dart';

import '../../pat_otp_verification.dart';

class PatOtpVerificationPage extends StatelessWidget {
  const PatOtpVerificationPage({super.key});
  static const routeName = 'app-otp-verification-page';
  static const routePath = 'app-otp-verification-page';
  @override
  Widget build(BuildContext context) {
    return const PatOtpVerificationView();
  }
}
