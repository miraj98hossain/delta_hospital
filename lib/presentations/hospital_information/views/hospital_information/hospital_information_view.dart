import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HospitalInformationView extends StatefulWidget {
  const HospitalInformationView({super.key});

  @override
  State<HospitalInformationView> createState() =>
      _HospitalInformationViewState();
}

class _HospitalInformationViewState extends State<HospitalInformationView> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            HospitalMenuWidget(
              title: "About Us",
              onTap: () {},
            ),
            HospitalMenuWidget(
              title: "Emmergency Contact",
              onTap: () {},
            ),
            HospitalMenuWidget(
              title: "Our Packages",
              onTap: () {},
            ),
            HospitalMenuWidget(
              title: "Health Checkup",
              onTap: () {},
            ),
            HospitalMenuWidget(
              title: "New Offers",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalMenuWidget extends StatelessWidget {
  const HospitalMenuWidget({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: appTheme.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: Text(
                title,
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: appTheme.secondary,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: appTheme.secondary,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
