import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DirectorModule extends StatelessWidget {
  const DirectorModule({
    super.key,
    required this.lable,
    this.onTap,
  });
  final String lable;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        shadowColor: appTheme.black,
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: appTheme.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lable,
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: appTheme.primary,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: appTheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    size: 15,
                    weight: 20,
                    Icons.arrow_forward_sharp,
                    color: appTheme.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
