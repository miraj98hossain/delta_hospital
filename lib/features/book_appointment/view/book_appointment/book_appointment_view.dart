import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../../../app/widgets/common_drop_down.dart';
import '../../book_appointment.dart';
import 'widgets/week_schedule_widget.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key});

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SingleChildScrollView(
        child: Container(
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
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: appTheme.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. John Doe",
                                style: lightTextTheme.bodyMedium!.copyWith(),
                              ),
                              Text(
                                "Kidney Specialist",
                                style: lightTextTheme.bodySmall!.copyWith(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Choose Type",
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonDropdownButton(
                      hintText: "Patient Type",
                      onChanged: (value) {},
                      items: List.generate(20, (index) => index),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CommonDropdownButton(
                      hintText: "Consultation Type",
                      onChanged: (value) {},
                      items: List.generate(20, (index) => index),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Select Patient",
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonDropdownButton(
                hintText: "Select Patient",
                onChanged: (value) {},
                items: List.generate(20, (index) => index),
              ),
              const SizedBox(
                height: 10,
              ),
              const ScheduleWidget(),
              const SizedBox(
                height: 10,
              ),
              const WeekSchedule(),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                color: appTheme.white,
                child: ExpansionTile(
                  title: Text(
                    "Morning",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available Slots",
                              style: lightTextTheme.bodyMedium!.copyWith(
                                color: appTheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: appTheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "20",
                                style: lightTextTheme.bodyMedium!.copyWith(
                                  color: appTheme.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          thickness: 1,
                          color: appTheme.lightCyan,
                          indent: 0,
                          endIndent: 0,
                          height: 1,
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 200,
                          child: GridView.builder(
                            itemCount: 50,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisExtent:
                                  MediaQuery.of(context).size.height * 0.05,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: appTheme.lightCyan,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                color: appTheme.white,
                child: ExpansionTile(
                  title: Text(
                    "Evening",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available Slots",
                              style: lightTextTheme.bodyMedium!.copyWith(
                                color: appTheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: appTheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "20",
                                style: lightTextTheme.bodyMedium!.copyWith(
                                  color: appTheme.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          thickness: 1,
                          color: appTheme.lightCyan,
                          indent: 0,
                          endIndent: 0,
                          height: 1,
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 200,
                          child: GridView.builder(
                            itemCount: 50,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisExtent:
                                  MediaQuery.of(context).size.height * 0.05,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: appTheme.lightCyan,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonElevatedButton(
                    lable: "Book Appointment",
                    backgroundColor: appTheme.secondary,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
