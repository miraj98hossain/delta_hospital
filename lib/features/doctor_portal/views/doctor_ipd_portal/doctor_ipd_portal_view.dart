import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DoctorIpdPortalView extends StatefulWidget {
  const DoctorIpdPortalView({super.key});

  @override
  State<DoctorIpdPortalView> createState() => _DoctorIpdPortalViewState();
}

class _DoctorIpdPortalViewState extends State<DoctorIpdPortalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Admission Id : ",
                      ),
                      Text("1234"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patient Name : ",
                      ),
                      Expanded(
                        child: Text(
                          "Miraj Hossain Shawon",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Gender : ",
                          ),
                          Text("Male"),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "Age : ",
                          ),
                          Text("34Y7M9D"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Bed Name : ",
                      ),
                      Text(
                        "Pre Cath-Bed 1",
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Addmission Date : ",
                      ),
                      Text("10-Aug-2024-12:00:00"),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
