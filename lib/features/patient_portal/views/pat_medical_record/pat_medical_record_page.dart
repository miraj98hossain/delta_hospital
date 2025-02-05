import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/patient_portal/views/pat_medical_record/bloc/report_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pat_medical_record.dart';

class PatMedicalRecordPage extends StatelessWidget {
  const PatMedicalRecordPage({super.key});
  static const routeName = 'pat-medical-record-page';
  static const routePath = 'pat-medical-record-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReportBloc(getService()),
        ),
      ],
      child: const PatMedicalRecordView(),
    );
  }
}
