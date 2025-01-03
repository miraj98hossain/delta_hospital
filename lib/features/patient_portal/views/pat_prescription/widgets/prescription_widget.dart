import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/patient_portal/data/models/patient_prescription_gridlist_response.dart';
import 'package:flutter/material.dart';

class PrescriptionWidget extends StatelessWidget {
  const PrescriptionWidget({
    super.key,
    required this.data,
  });

  final Prescription? data;

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
