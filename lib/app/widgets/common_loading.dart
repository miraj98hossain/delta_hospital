import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: appTheme.secondary,
      ),
    );
  }
}
