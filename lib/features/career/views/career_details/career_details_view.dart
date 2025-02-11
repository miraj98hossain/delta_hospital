import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CareerDetailsView extends StatefulWidget {
  const CareerDetailsView({super.key});

  @override
  State<CareerDetailsView> createState() => _CareerDetailsViewState();
}

class _CareerDetailsViewState extends State<CareerDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            spacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Short Description",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appTheme.secondary,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Long Description",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appTheme.secondary,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: CommonElevatedButton(
                      onPressed: () {},
                      backgroundColor: appTheme.secondary,
                      lable: "Apply By BD Jobs",
                    ),
                  ),
                  Expanded(
                    child: CommonElevatedButton(
                      onPressed: () {},
                      backgroundColor: appTheme.secondary,
                      lable: "Apply By Email",
                    ),
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
