import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MngDashWidget extends StatelessWidget {
  const MngDashWidget({
    super.key,
    required this.lable,
    required this.image,
    this.onTap,
  });
  final String lable;
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lable,
                  textAlign: TextAlign.left,
                  style: lightTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
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
                      Icons.arrow_outward_rounded,
                      color: appTheme.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: appTheme.lightCyan,
                image: DecorationImage(
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
