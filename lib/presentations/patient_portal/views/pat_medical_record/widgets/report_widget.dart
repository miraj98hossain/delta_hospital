import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/patient_portal/data/models/patient_report_gridlist_response.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_medical_record/bloc/report_pdf_bloc.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pdf_viewer/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return BlocProvider(
      create: (context) => ReportPdfBloc(getService()),
      child: BlocListener<ReportPdfBloc, ReportPdfState>(
        listener: (context, state) {
          if (state is ReportPdfSuccess) {
            context.pushNamed(PdfViewerPage.routeName, extra: {
              'pdfData': state.data,
              'title': data?.repItemName?.toString() ?? "",
            });
          }
        },
        child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                      BlocBuilder<ReportPdfBloc, ReportPdfState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context.read<ReportPdfBloc>().add(
                                    ReportPdfGet(
                                      hnId: data?.hospitalNumber ?? "",
                                      report: data ?? Report(),
                                    ),
                                  );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: appTheme.secondary,
                                borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(5),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: Text(
                                      state is ReportPdfLoading
                                          ? "Viewing..."
                                          : "View",
                                      style: lightTextTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: appTheme.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
