import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Added Items",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Drain Fluid For Bilirubin",
                                  style: lightTextTheme.bodyMedium!.copyWith(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "1000 Tk.",
                                style: lightTextTheme.bodyMedium!.copyWith(
                                  color: appTheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appTheme.secondary.withOpacity(0.5),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: appTheme.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount:",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                  Text(
                    "0 Tk.",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Collection Fee:",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                  Text(
                    "0 Tk.",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Test:",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                  Text(
                    "3",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total:",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                  Text(
                    "2000 Tk.",
                    style: lightTextTheme.bodyMedium!.copyWith(
                      color: appTheme.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                child: CommonElevatedButton(
                  lable: "Proceed",
                  backgroundColor: appTheme.secondary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
