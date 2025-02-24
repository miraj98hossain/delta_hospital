import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_prescription/bloc/prescription_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pat_prescription.dart';

class PatPrescriptionPage extends StatelessWidget {
  const PatPrescriptionPage({super.key});
  static const routeName = 'pat-prescription-page';
  static const routePath = 'pat-prescription-page';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrescriptionBloc(getService()),
      child: const PatPrescriptionView(),
    );
  }
}
