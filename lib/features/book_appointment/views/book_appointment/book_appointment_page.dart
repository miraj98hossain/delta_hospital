import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/cubit/variable_state_cubit.dart';
import '../../book_appointment.dart';

class BookAppointmentPage extends StatelessWidget {
  const BookAppointmentPage({super.key});
  static const routeName = 'book-appointment-page';
  static const routePath = 'book-appointment-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              VariableStateCubit<DateTime>()..update(DateTime.now()),
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
      child: const BookAppointmentView(),
    );
  }
}
