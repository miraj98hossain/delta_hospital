import 'package:delta_hospital/app/app.dart';
import 'package:flutter/material.dart';

class PatMedicalRecordView extends StatefulWidget {
  const PatMedicalRecordView({super.key});

  @override
  State<PatMedicalRecordView> createState() => _PatMedicalRecordViewState();
}

class _PatMedicalRecordViewState extends State<PatMedicalRecordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const Text("Medical Record"),
          ],
        ),
      ),
    );
  }
}
