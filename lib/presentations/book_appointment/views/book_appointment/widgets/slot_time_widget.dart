import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:flutter/material.dart';
import '../../../../../app/widgets/app_snack_bar.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../data/models/available_slot_response.dart';

class SlotTime extends StatelessWidget {
  const SlotTime({
    super.key,
    required this.slot,
    this.isSlected = false,
    required this.onSelected,
  });

  final Slot slot;
  final bool isSlected;
  final Function(Slot) onSelected;
  BoxDecoration _getDecoration() {
    if (slot.appointStatus == 1) {
      return BoxDecoration(
        color: appTheme.secondary,
        borderRadius: BorderRadius.circular(10),
      );
    } else if (slot.appointStatus == 8) {
      return BoxDecoration(
        color: Colors.pink.shade700,
        borderRadius: BorderRadius.circular(10),
      );
    } else if (DateTime.parse(slot.endTime ?? "")
        .toLocal()
        .isBefore(DateTime.now())) {
      return BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(10),
      );
    } else if (isSlected) {
      return BoxDecoration(
        color: appTheme.lightCyan,
        border: Border.all(color: appTheme.primary),
        borderRadius: BorderRadius.circular(10),
      );
    } else {
      return BoxDecoration(
        color: appTheme.lightCyan,
        borderRadius: BorderRadius.circular(10),
      );
    }
  }

  TextStyle _getTextStyle() {
    if (slot.appointStatus == 1) {
      return lightTextTheme.bodySmall!.copyWith(
        fontSize: 12.5,
        color: appTheme.white,
        fontWeight: FontWeight.bold,
      );
    } else if (slot.appointStatus == 8) {
      return lightTextTheme.bodySmall!.copyWith(
        fontSize: 12.5,
        color: appTheme.white,
        fontWeight: FontWeight.bold,
      );
    } else {
      return lightTextTheme.bodySmall!.copyWith(
        fontSize: 12.5,
        // color: appTheme.white,
        fontWeight: FontWeight.bold,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (slot.appointStatus == 1) {
          AppSnackBar.showSnackBar(
            context: context,
            message: "Slot Already Booked",
            type: SnackBarType.error,
          );
          return;
        } else if (slot.appointStatus == 8) {
          AppSnackBar.showSnackBar(
              context: context,
              message: "Slot Already Blocked",
              type: SnackBarType.error);
          return;
        } else {
          onSelected(slot);
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: _getDecoration(),
        child: Center(
          child: Text(
            DateTime.parse(slot.startTime ?? "")
                .toLocal()
                .toFormatedString("hh:mm a"),
            style: _getTextStyle(),
          ),
        ),
      ),
    );
  }
}
