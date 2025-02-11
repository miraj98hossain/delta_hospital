import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/career/career_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CareerListView extends StatefulWidget {
  const CareerListView({super.key});

  @override
  State<CareerListView> createState() => _CareerListViewState();
}

class _CareerListViewState extends State<CareerListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Job Openings",
              style: lightTextTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: appTheme.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 15,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(CareerDetailsPage.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: appTheme.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Expanded(
                            child: Text(
                              "Medical Officer (Medicine Specialist)",
                              style: lightTextTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: appTheme.secondary,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appTheme.secondary,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
