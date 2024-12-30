import 'package:flutter/material.dart';
import '../../pat_medical_record.dart';

class PatMedicalRecordPage extends StatelessWidget {
  const PatMedicalRecordPage({super.key});
  static const routeName = 'pat-medical-record-page';
  static const routePath = 'pat-medical-record-page';
  @override
  Widget build(BuildContext context) {
    return const PatMedicalRecordView();
  }
}
