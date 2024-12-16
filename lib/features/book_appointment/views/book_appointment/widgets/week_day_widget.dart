import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';

class WeekDayWidget extends StatelessWidget {
  const WeekDayWidget({
    super.key,
    required this.date,
    this.isSlected = false,
    this.onTap,
  });

  final DateTime? date;
  final bool isSlected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: isSlected ? appTheme.secondary : appTheme.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              date?.toFormatedString("EEE") ?? "",
              style: lightTextTheme.bodyMedium!.copyWith(
                color: isSlected ? appTheme.white : appTheme.primary,
              ),
            ),
            Text(
              date?.day.toString() ?? "",
              style: lightTextTheme.bodyMedium!.copyWith(
                color: isSlected ? appTheme.white : appTheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
