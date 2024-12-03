import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../director.dart';
import '../director_portal/director_portal_page.dart';
import '../director_portfolio/director_portfolio_page.dart';

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
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Row(
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
              onTap: () {
                context.pushNamed(DirectorPortalPage.routeName);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DirectorModule(
              lable: "Portfolio",
              onTap: () {
                context.pushNamed(DirectorPortfolioPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
