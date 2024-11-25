import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ModuleWidget extends StatelessWidget {
  const ModuleWidget({
    super.key,
    required this.lable,
    required this.icon,
    this.onTap,
  });
  final String lable;
  final String icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: 48,
              width: 48,
              icon,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              lable,
              style: lightTextTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
