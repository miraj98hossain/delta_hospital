import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/patient_portal/data/models/patient_prescription_gridlist_response.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_prescription/bloc/prescription_pdf_bloc.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pdf_viewer/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PrescriptionWidget extends StatelessWidget {
  const PrescriptionWidget({
    super.key,
    required this.data,
  });

  final Prescription? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrescriptionPdfBloc(getService()),
      child: PrescriptionWidgetContent(data: data),
    );
  }
}

class PrescriptionWidgetContent extends StatelessWidget {
  const PrescriptionWidgetContent({
    super.key,
    required this.data,
  });

  final Prescription? data;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PrescriptionPdfBloc, PrescriptionPdfState>(
      listener: (context, state) {
        if (state is PrescriptionPdfSuccess) {
          context.pushNamed(PdfViewerPage.routeName, extra: {
            'pdfData': state.prescriptionPdf,
            'title': data?.prescriptionNo?.toString() ?? "",
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
                      width: 20,
                      decoration: BoxDecoration(
                        color: data?.prescriptionNo == null
                            ? Colors.pink.shade600
                            : appTheme.secondary,
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(3),
                        ),
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
                                        Text(data?.doctorName ?? ""),
                                        Text(
                                          data?.prescriptionDateTime == null
                                              ? ""
                                              : DateTime.parse(
                                                  data?.prescriptionDateTime ??
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
                    const SizedBox(
                      width: 10,
                    ),
                    data?.prescriptionNo != null
                        ? BlocBuilder<PrescriptionPdfBloc,
                            PrescriptionPdfState>(
                            builder: (context, state) {
                              return CommonElevatedButton(
                                lable: state is PrescriptionPdfLoading
                                    ? "Viewing..."
                                    : "View",
                                onPressed: () {
                                  context.read<PrescriptionPdfBloc>().add(
                                        PrescriptionPdfGet(
                                            prescriptionId:
                                                data?.prescriptionNo ?? 0),
                                      );
                                },
                              );
                            },
                          )
                        : Container(),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
