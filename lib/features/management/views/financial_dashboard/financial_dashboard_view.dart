import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinancialDashboardView extends StatefulWidget {
  const FinancialDashboardView({super.key});

  @override
  State<FinancialDashboardView> createState() => _FinancialDashboardViewState();
}

class _FinancialDashboardViewState extends State<FinancialDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_sharp,
                    color: appTheme.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Financial Dashboard",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: appTheme.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Form",
                        style: lightTextTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: appTheme.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: appTheme.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DD/MM/YYYY",
                              style: lightTextTheme.bodySmall!.copyWith(
                                fontSize: 10,
                              ),
                            ),
                            Icon(
                              size: 18,
                              Icons.calendar_today_outlined,
                              color: appTheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To",
                        style: lightTextTheme.bodySmall!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: appTheme.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: appTheme.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DD/MM/YYYY",
                              style: lightTextTheme.bodySmall!.copyWith(
                                fontSize: 10,
                              ),
                            ),
                            Icon(
                              size: 18,
                              Icons.calendar_today_outlined,
                              color: appTheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 1,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reports",
                        style: lightTextTheme.bodySmall!.copyWith(
                          color: appTheme.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Daily Collection",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1500 Tk",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LinearProgressIndicator(
                        minHeight: 7,
                        value: 0.5,
                        color: appTheme.primary,
                        backgroundColor: appTheme.skyBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Daily Expense",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1500 Tk",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LinearProgressIndicator(
                        minHeight: 7,
                        value: 0.9,
                        color: appTheme.primary,
                        backgroundColor: appTheme.skyBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pathological Income",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1500 Tk",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LinearProgressIndicator(
                        minHeight: 7,
                        value: 0.45,
                        color: appTheme.primary,
                        backgroundColor: appTheme.skyBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Radiology Income",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1500 Tk",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LinearProgressIndicator(
                        minHeight: 7,
                        value: 0.5,
                        color: appTheme.primary,
                        backgroundColor: appTheme.skyBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Radiotherapy Income",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1500 Tk",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LinearProgressIndicator(
                        minHeight: 7,
                        value: 0.8,
                        color: appTheme.primary,
                        backgroundColor: appTheme.skyBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pharmacy Income",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "1500 Tk",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      LinearProgressIndicator(
                        minHeight: 7,
                        value: 0.2,
                        color: appTheme.primary,
                        backgroundColor: appTheme.skyBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
