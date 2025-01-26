import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/management/data/models/financial_dash_report_response.dart';
import 'package:delta_hospital/features/management/views/financial_dashboard/bloc/financial_report_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FinancialDashboardView extends StatefulWidget {
  const FinancialDashboardView({super.key});

  @override
  State<FinancialDashboardView> createState() => _FinancialDashboardViewState();
}

class _FinancialDashboardViewState extends State<FinancialDashboardView> {
  @override
  Widget build(BuildContext context) {
    var selectedFrmDate = context.select(
      (VariableStateCubit<DateTime> cubit) => cubit.state,
    );
    var selectedToDate = context.select(
      (VariableStateCubit<String> cubit) => cubit.state,
    );
    return Scaffold(
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
                    "Financial Dashboard",
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
                          if (selectedFrmDate != null &&
                              selectedToDate != null &&
                              context.mounted) {
                            context.read<FinancialReportBloc>().add(
                                  FinancialReportGet(
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
                            context.read<FinancialReportBloc>().add(
                                  FinancialReportGet(
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
              child: BlocBuilder<FinancialReportBloc, FinancialReportState>(
                builder: (context, state) {
                  if (state is FinancialReportLoading) {
                    return const CommonLoading();
                  }
                  if (state is FinancialReportSuccess) {
                    return ListView.separated(
                        itemCount: state.financialReportList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemBuilder: (context, index) {
                          var data = state.financialReportList[index];
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.dataTypeName ?? "",
                                      style: lightTextTheme.bodySmall!.copyWith(
                                        color: appTheme.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      data.totalCollection ?? "0",
                                      style: lightTextTheme.bodySmall!.copyWith(
                                        color: appTheme.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FinancialCategory(
                                  title: "Initial Collection",
                                  categoryTotal: data.totalCollection ?? "0",
                                  percentage: _calculatePercentage(
                                      data.totalCollection ?? "1",
                                      data.initialCollection ?? "0"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FinancialCategory(
                                  title: "Due Collection",
                                  categoryTotal: data.totalCollection ?? "0",
                                  percentage: _calculatePercentage(
                                      data.totalCollection ?? "1",
                                      data.dueCollection ?? "0"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FinancialCategory(
                                  title: "Refund Collection",
                                  categoryTotal: data.totalCollection ?? "0",
                                  percentage: _calculatePercentage(
                                      data.totalCollection ?? "1",
                                      data.dueCollection ?? "0"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FinancialCategory(
                                  title: "Total Refund Collection",
                                  categoryTotal: data.totalCollection ?? "0",
                                  percentage: _calculatePercentage(
                                      data.totalCollection ?? "1",
                                      data.totalRefund ?? "0"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FinancialCategory(
                                  title: "Actual Total  Collection",
                                  categoryTotal: data.totalCollection ?? "0",
                                  percentage: _calculatePercentage(
                                      data.totalCollection ?? "1",
                                      data.actualTotalCollection ?? "0"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FinancialCategory(
                                  title: "Doctor Collection",
                                  categoryTotal: data.totalCollection ?? "0",
                                  percentage: _calculatePercentage(
                                      data.totalCollection ?? "1",
                                      data.doctorCollection ?? "0"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FinancialCategory(
                                  title: "Net Collection",
                                  categoryTotal: data.totalCollection ?? "0",
                                  percentage: _calculatePercentage(
                                      data.totalCollection ?? "1",
                                      data.netCollection ?? "0"),
                                ),
                              ],
                            ),
                          );
                        });
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

class FinancialCategory extends StatelessWidget {
  const FinancialCategory({
    super.key,
    required this.title,
    required this.categoryTotal,
    required this.percentage,
  });

  final String title;
  final String categoryTotal;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: lightTextTheme.bodySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              categoryTotal,
              style: lightTextTheme.bodySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
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
