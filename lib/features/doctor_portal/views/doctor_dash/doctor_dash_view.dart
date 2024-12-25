import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal_dashboard/widgets/pat_dash_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../doctor_ipd_portal.dart';
import '../../doctor_opd_portal.dart';

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
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Miraj Hossain Shawon"),
                  Text("Kidney Specialist"),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              children: [
                Expanded(
                  child: PatDashWidget(
                    lable: "OPD Portal",
                    image: ImageConstant.doctorVisit,
                    onTap: () {
                      context.pushNamed(DoctorOpdPortalPage.routeName);
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: PatDashWidget(
                    lable: "IPD Portal",
                    image: ImageConstant.hospital,
                    onTap: () {
                      context.pushNamed(DoctorIpdPortalPage.routeName);
                    },
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
