import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: appTheme.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Schedule",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    color: appTheme.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  BlocBuilder<VariableStateCubit<DateTime>, DateTime?>(
                    builder: (context, state) {
                      return Text(
                        context
                                .watch<VariableStateCubit<DateTime>>()
                                .state
                                ?.toFormatedString("dd-MM-yyyy") ??
                            "",
                        style: lightTextTheme.bodyMedium!.copyWith(
                          color: appTheme.primary,
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      var date =
                          context.read<VariableStateCubit<DateTime>>().state;
                      var selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                        initialDate: date,
                      );
                      if (selectedDate != null && context.mounted) {
                        context
                            .read<VariableStateCubit<DateTime>>()
                            .update(selectedDate);
                        context
                            .read<VariableStateCubit<List<DateTime>>>()
                            .update(
                              List.generate(
                                6,
                                (e) => selectedDate.add(
                                  Duration(days: e),
                                ),
                              ),
                            );
                      }
                    },
                    icon: Icon(
                      size: 20,
                      color: appTheme.primary,
                      Icons.calendar_today_outlined,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
