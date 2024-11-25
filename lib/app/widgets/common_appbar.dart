import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(65.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: appTheme.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                height: 46,
                width: 44,
                ImageConstant.appBarMenu,
              ),
              Image.asset(
                height: 50,
                width: 57,
                ImageConstant.companyLogo,
              ),
              Image.asset(
                height: 46,
                width: 44,
                ImageConstant.appBarNotification,
              )
            ],
          ),
        ],
      ),
    );
  }
}
