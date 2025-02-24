import 'package:flutter/material.dart';

import '../../hospital_information.dart';

class HospitalInformationPage extends StatelessWidget {
  const HospitalInformationPage({super.key});
  static const String routeName = "hospital-information-page";
  static const String routePath = "hospital-information-page";
  @override
  Widget build(BuildContext context) {
    return const HospitalInformationView();
  }
}
