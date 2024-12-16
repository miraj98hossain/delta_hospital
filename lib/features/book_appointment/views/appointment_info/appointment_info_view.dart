import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppointmentInfoView extends StatefulWidget {
  const AppointmentInfoView({super.key});

  @override
  State<AppointmentInfoView> createState() => _AppointmentInfoViewState();
}

class _AppointmentInfoViewState extends State<AppointmentInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Dr. John Doe",
                          style: lightTextTheme.bodyMedium!.copyWith(),
                        ),
                      ),
                      Text(
                        "1000 Tk.",
                        style: lightTextTheme.bodyMedium!.copyWith(),
                      ),
                    ],
                  ),
                  Text(
                    "Kidney Specialist",
                    style: lightTextTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Appointment Info",
              style: lightTextTheme.bodyMedium!.copyWith(
                color: appTheme.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "${DateTime.now().toFormatedString("dd-MMM-yyyy")} (${DateTime.now().toFormatedString("EEEE")})",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.secondary,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Serial",
                            style: lightTextTheme.bodyMedium!.copyWith(
                              color: appTheme.secondary,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: appTheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "20",
                                style: lightTextTheme.bodySmall!.copyWith(
                                  color: appTheme.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time",
                        style: lightTextTheme.bodyMedium!.copyWith(
                          color: appTheme.secondary,
                        ),
                      ),
                      Text(
                        "10:00 AM",
                        style: lightTextTheme.bodyMedium!.copyWith(
                          color: appTheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Select Payment Method",
              style: lightTextTheme.bodyMedium!.copyWith(
                color: appTheme.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CommonDropdownButton(
              hintText: "Select Payment Method",
              onChanged: (value) {},
              items: List.generate(2, (index) => index),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: CommonElevatedButton(
                lable: "Get Appointment",
                backgroundColor: appTheme.secondary,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
