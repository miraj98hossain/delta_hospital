import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';

class PatPrescriptionView extends StatefulWidget {
  const PatPrescriptionView({super.key});

  @override
  State<PatPrescriptionView> createState() => _PatPrescriptionViewState();
}

class _PatPrescriptionViewState extends State<PatPrescriptionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(),
    );
  }
}
