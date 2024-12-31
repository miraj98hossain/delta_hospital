import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_report_gridlist_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/report_bloc.dart';

class PatMedicalRecordView extends StatefulWidget {
  const PatMedicalRecordView({super.key});

  @override
  State<PatMedicalRecordView> createState() => _PatMedicalRecordViewState();
}

class _PatMedicalRecordViewState extends State<PatMedicalRecordView> {
  @override
  void initState() {
    context.read<ReportBloc>().add(GetReportEvent());
    super.initState();
  }

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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<ReportBloc, ReportState>(
                builder: (context, state) {
                  if (state is ReportLoading) {
                    return const CommonLoading();
                  }
                  if (state is ReportSuccess) {
                    return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: state.reportGridList.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var data = state.reportGridList.data?[index];
                          return ReportWidget(data: data);
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
}

class ReportWidget extends StatelessWidget {
  const ReportWidget({
    super.key,
    required this.data,
  });

  final Report? data;
  Color _getReportStatusColor() {
    if (data?.billStatus == "1") {
      return Colors.pink.shade600;
    } else if (data?.isReady == 1) {
      return Colors.green;
    } else if (data?.isReady == 0) {
      return Colors.yellow.shade600;
    } else {
      return appTheme.secondary;
    }
  }

  String _getReportStatus() {
    if (data?.billStatus == "1") {
      return "Due";
    } else if (data?.isReady == 1) {
      return "Ready";
    } else if (data?.isReady == 0) {
      return "Pending";
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white,
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: _getReportStatusColor(),
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            _getReportStatus(),
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: appTheme.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data?.repItemName ?? ""),
                                      Text(data?.itemTypeName ?? ""),
                                      Text(
                                        data?.reportDeliveryDateTime == null
                                            ? ""
                                            : DateTime.parse(
                                                data?.reportDeliveryDateTime ??
                                                    "",
                                              ).toFormatedString(
                                                "dd-MMM-yyyy",
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
