import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class DirectorView extends StatefulWidget {
  const DirectorView({super.key});

  @override
  State<DirectorView> createState() => _DirectorViewState();
}

class _DirectorViewState extends State<DirectorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_back_sharp,
                  color: appTheme.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Management",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: appTheme.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 165,
              width: 162,
              decoration: BoxDecoration(
                border: Border.all(
                  color: appTheme.skyBlue,
                  width: 2.5,
                ),
                image: DecorationImage(
                  image: AssetImage(ImageConstant.user),
                  fit: BoxFit.fitHeight,
                ),
                shape: BoxShape.circle,
                color: appTheme.skyBlue,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Miraj Hossain Shawon",
              style: lightTextTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: appTheme.white,
              ),
            ),
            Text(
              "Director",
              style: lightTextTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: appTheme.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DirectorModule(
              lable: "Portal",
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            DirectorModule(
              lable: "Portfolio",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

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
