import 'package:flutter/material.dart';

import '../../pat_prescription.dart';

class PatPrescriptionPage extends StatelessWidget {
  const PatPrescriptionPage({super.key});
  static const routeName = 'pat-prescription-page';
  static const routePath = 'pat-prescription-page';
  @override
  Widget build(BuildContext context) {
    return const PatPrescriptionView();
  }
}
