import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/patient_type_response.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/consultation_type_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/patient_type_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/book_appointment/bloc/slot_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/cubit/variable_state_cubit.dart';
import '../../book_appointment.dart';

class BookAppointmentPage extends StatelessWidget {
  const BookAppointmentPage({super.key, required this.doctor});
  static const routeName = 'book-appointment-page';
  static const routePath = 'book-appointment-page';
  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PatientTypeBloc(getService()),
        ),
        BlocProvider(
          create: (context) => ConsultationTypeBloc(getService()),
        ),
        BlocProvider(
          create: (context) => SlotBloc(getService()),
        ),
        BlocProvider(
          create: (context) =>
              VariableStateCubit<DateTime>()..update(DateTime.now()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<PatientType>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<ConsultationType>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<List<DateTime>>()
            ..update(
              List.generate(
                6,
                (e) => DateTime.now().add(
                  Duration(days: e),
                ),
              ),
            ),
        ),
      ],
      child: BookAppointmentView(
        doctor: doctor,
      ),
    );
  }
}
