import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    required this.lable,
  });
  final void Function()? onPressed;
  final Color? backgroundColor;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom().copyWith(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.all(5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        lable,
        textAlign: TextAlign.center,
        style: lightTextTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: appTheme.white,
        ),
      ),
    );
  }
}
