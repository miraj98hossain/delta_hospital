import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/presentations/book_appointment/views/doctor_info/bloc/doctor_info_bloc.dart';
import 'package:delta_hospital/presentations/book_appointment/views/doctor_info/bloc/doctor_schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../doctor_info.dart';

class DoctorInfoPage extends StatefulWidget {
  const DoctorInfoPage({super.key, required this.doctor});
  static const String routeName = 'doctor-info-page';
  static const String routePath = 'doctor-info-page';
  final Doctor doctor;
  @override
  State<DoctorInfoPage> createState() => _DoctorInfoPageState();
}

class _DoctorInfoPageState extends State<DoctorInfoPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorInfoBloc(getService()),
        ),
        BlocProvider(
          create: (context) => DoctorScheduleBloc(getService()),
        ),
      ],
      child: DoctorInfoView(
        doctor: widget.doctor,
      ),
    );
  }
}
