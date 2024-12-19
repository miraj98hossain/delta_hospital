import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'week_day_widget.dart';

class WeekSchedule extends StatelessWidget {
  const WeekSchedule({
    super.key,
    required this.getConsultationType,
    required this.getAvailableSlot,
  });
  final void Function() getConsultationType;
  final void Function() getAvailableSlot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: BlocBuilder<VariableStateCubit<List<DateTime>>, List<DateTime>?>(
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemBuilder: (context, index) {
              var date = state?[index];
              return WeekDayWidget(
                date: date,
                isSlected: date?.day ==
                    context.watch<VariableStateCubit<DateTime>>().state?.day,
                onTap: () {
                  if (date == null) return;
                  context.read<VariableStateCubit<DateTime>>().update(date);
                  getConsultationType();
                  getAvailableSlot();
                },
              );
            },
          );
        },
      ),
    );
  }
}
