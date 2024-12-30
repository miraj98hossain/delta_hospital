import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/patient_portal/views/pat_prescription/bloc/prescription_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatPrescriptionView extends StatefulWidget {
  const PatPrescriptionView({super.key});

  @override
  State<PatPrescriptionView> createState() => _PatPrescriptionViewState();
}

class _PatPrescriptionViewState extends State<PatPrescriptionView> {
  @override
  void initState() {
    context.read<PrescriptionBloc>().add(GetPrescriptionEvent());
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
              child: BlocBuilder<PrescriptionBloc, PrescriptionState>(
                builder: (context, state) {
                  if (state is PrescriptionLoading) {
                    return const CommonLoading();
                  }
                  if (state is PrescriptionSuccess) {
                    return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: state.prescriptionGridList.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var data = state.prescriptionGridList.data?[index];
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: data?.prescriptionNo == null
                                                ? Colors.pink.shade600
                                                : appTheme.secondary,
                                            borderRadius:
                                                const BorderRadius.horizontal(
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                data?.doctorName ??
                                                                    ""),
                                                            Text(
                                                              data?.prescriptionDateTime ==
                                                                      null
                                                                  ? ""
                                                                  : DateTime
                                                                      .parse(
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
