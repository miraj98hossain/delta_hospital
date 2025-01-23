import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/management/data/models/opd_ipd_patient_report_response.dart';
import 'package:delta_hospital/features/management/views/director_portal/bloc/patient_report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DirectorPortalView extends StatefulWidget {
  const DirectorPortalView({super.key});

  @override
  State<DirectorPortalView> createState() => _DirectorPortalViewState();
}

class _DirectorPortalViewState extends State<DirectorPortalView> {
  @override
  Widget build(BuildContext context) {
    var selectedFrmDate = context.select(
      (VariableStateCubit<DateTime> cubit) => cubit.state,
    );
    var selectedToDate = context.select(
      (VariableStateCubit<String> cubit) => cubit.state,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_sharp,
                    color: appTheme.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Director Portal",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: appTheme.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Form",
                        style: lightTextTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: appTheme.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            initialDate: DateTime.now(),
                          );
                          if (date != null && context.mounted) {
                            context
                                .read<VariableStateCubit<DateTime>>()
                                .update(date);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedFrmDate
                                        ?.toFormatedString('dd-MMM-yyyy') ??
                                    "DD/MM/YYYY",
                                style: lightTextTheme.bodySmall!.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                size: 18,
                                Icons.calendar_today_outlined,
                                color: appTheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To",
                        style: lightTextTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: appTheme.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            initialDate: DateTime.now(),
                          );
                          if (date != null && context.mounted) {
                            context
                                .read<VariableStateCubit<String>>()
                                .update(date.toString());
                          }
                          if (selectedFrmDate != null &&
                              selectedToDate != null &&
                              context.mounted) {
                            context.read<PatientReportBloc>().add(
                                  PatientReportGet(
                                    fromDate: selectedFrmDate
                                        .toFormatedString("dd/MM/yyyy"),
                                    toDate: DateTime.parse(selectedToDate)
                                        .toFormatedString("dd/MM/yyyy"),
                                  ),
                                );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedToDate != null
                                    ? DateTime.parse(selectedToDate)
                                        .toFormatedString('dd-MMM-yyyy')
                                    : "DD/MM/YYYY",
                                style: lightTextTheme.bodySmall!.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                size: 18,
                                Icons.calendar_today_outlined,
                                color: appTheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<PatientReportBloc, PatientReportState>(
                builder: (context, state) {
                  if (state is PatientReportLoading) {
                    return const CommonLoading();
                  }
                  if (state is PatientReportSuccess) {
                    return ListView.separated(
                      itemCount: state.patientReportList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        var data = state.patientReportList[index];

                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: appTheme.skyBlue,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Icon(
                                          Icons.bar_chart,
                                          size: 12,
                                          color: appTheme.primary,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data.dataTypeName ?? "",
                                        style:
                                            lightTextTheme.bodySmall!.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    data.totalPatient ?? "0",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ProgressWidget(
                                title: "Male Patients",
                                value: data.malePatient ?? "0",
                                percentage: _calculatePercentage(
                                  data.totalPatient ?? "0",
                                  data.malePatient ?? "0",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ProgressWidget(
                                title: "Female Patients",
                                value: data.femalePatient ?? "0",
                                percentage: _calculatePercentage(
                                  data.totalPatient ?? "0",
                                  data.femalePatient ?? "0",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ProgressWidget(
                                title: "Other Patients",
                                value: data.otherPatient ?? "0",
                                percentage: _calculatePercentage(
                                  data.totalPatient ?? "0",
                                  data.otherPatient ?? "0",
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  double _calculatePercentage(String totalPatient, String categoryPatient) {
    double total = double.parse(totalPatient);
    double categoryTotal = double.parse(categoryPatient);
    double percentage = (categoryTotal / total);
    return percentage;
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
  });

  final String title;
  final String value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: appTheme.skyBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.male,
                    size: 14,
                    color: appTheme.primary,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: lightTextTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: lightTextTheme.bodySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        LinearProgressIndicator(
          minHeight: 7,
          value: percentage,
          color: appTheme.primary,
          backgroundColor: appTheme.skyBlue,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
