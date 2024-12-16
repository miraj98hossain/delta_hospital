import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BookingInfoView extends StatefulWidget {
  const BookingInfoView({super.key});

  @override
  State<BookingInfoView> createState() => _BookingInfoViewState();
}

class _BookingInfoViewState extends State<BookingInfoView> {
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
              width: double.infinity,
              decoration: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: lightTextTheme.bodyMedium!.copyWith(),
                  ),
                  Text(
                    "Dr. John Doe",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.primary,
                    ),
                  ),
                  Text(
                    "Payable Amount",
                    style: lightTextTheme.bodyMedium!.copyWith(),
                  ),
                  Text(
                    "1000 Tk",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.primary,
                    ),
                  )
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
                lable: "Proceed",
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
