import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../app/widgets/common_text_field_widget.dart';

class PatientInfoView extends StatefulWidget {
  const PatientInfoView({super.key});

  @override
  State<PatientInfoView> createState() => _PatientInfoViewState();
}

class _PatientInfoViewState extends State<PatientInfoView> {
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
              Text(
                "Patient Name",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CommonTextFieldWidget(
                hintText: "Full Name",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Patient Number",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CommonTextFieldWidget(
                hintText: "Patient Number",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Date of Birth",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CommonTextFieldWidget(
                hintText: "Date of Birth",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Patient Address",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CommonTextFieldWidget(
                hintText: "Patient Address",
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: CommonElevatedButton(
                  lable: "Proceed",
                  backgroundColor: appTheme.secondary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
