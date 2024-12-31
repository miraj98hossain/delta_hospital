import 'package:delta_hospital/app/app.dart';
import 'package:flutter/material.dart';

class PatNotesView extends StatefulWidget {
  const PatNotesView({super.key});

  @override
  State<PatNotesView> createState() => _PatNotesViewState();
}

class _PatNotesViewState extends State<PatNotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(),
    );
  }
}
