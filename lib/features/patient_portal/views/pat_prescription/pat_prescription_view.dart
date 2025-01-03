import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/patient_portal/views/pat_prescription/bloc/prescription_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/prescription_widget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Prescriptions->",
              style: lightTextTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: appTheme.white,
              ),
            ),
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
                        return PrescriptionWidget(data: data);
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
}
