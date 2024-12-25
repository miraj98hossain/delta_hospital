import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal_dashboard/widgets/pat_dash_widget.dart';
import 'package:flutter/material.dart';

class DoctorDashView extends StatefulWidget {
  const DoctorDashView({super.key});

  @override
  State<DoctorDashView> createState() => _DoctorDashViewState();
}

class _DoctorDashViewState extends State<DoctorDashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Row(
              children: [
                Expanded(
                  child: PatDashWidget(
                    lable: "OPD Portal",
                    image: ImageConstant.doctorVisit,
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: PatDashWidget(
                    lable: "IPD Portal",
                    image: ImageConstant.hospital,
                    onTap: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
