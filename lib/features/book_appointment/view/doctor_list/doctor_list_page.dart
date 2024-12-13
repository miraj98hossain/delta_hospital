import 'package:flutter/material.dart';

import '../../doctor_list.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});
  static const routeName = 'doctor-list-page';
  static const routePath = '/doctor-list-page';
  @override
  Widget build(BuildContext context) {
    return const DoctorListView();
  }
}
