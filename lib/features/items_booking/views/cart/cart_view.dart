import 'package:collection/collection.dart';
import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/features/items_booking/patient_info.dart';
import 'package:delta_hospital/features/items_booking/views/item_list/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  num totalTest = 0;
  num totalAmount = 0;
  @override
  void initState() {
    context.read<CartBloc>().add(CartItemsGet());
    super.initState();
  }

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
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const CommonLoading();
                  }
                  if (state is CartSuccess) {
                    for (var element in state.cartList) {
                      totalTest += 1;
                      totalAmount += element.salesPrice ?? 0;
                    }
                    var groupedList = state.cartList.groupListsBy(
                      (item) => item.itemId,
                    );
                    return ListView.separated(
                      itemCount: groupedList.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = groupedList.entries.toList()[index];
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
                                        data.value.first.itemName ?? "",
                                        style: lightTextTheme.bodyMedium!
                                            .copyWith(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${data.value.first.salesPrice ?? ""} Tk.",
                                      style:
                                          lightTextTheme.bodyMedium!.copyWith(
                                        color: appTheme.primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "(${data.value.length})*",
                                      style:
                                          lightTextTheme.bodyMedium!.copyWith(
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
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                context.read<CartBloc>().add(
                                    CartItemRemove(itemInfo: data.value.first));
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: appTheme.secondary.withValues(
                                    alpha: 0.5,
                                  ),
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
                    );
                  }
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appTheme.white,
                    ),
                    width: double.infinity,
                    child: const Center(
                      child: Text("No Item Added"),
                    ),
                  );
                },
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
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Collection Fee:",
              //       style: lightTextTheme.bodyMedium!.copyWith(
              //         color: appTheme.white,
              //       ),
              //     ),
              //     Text(
              //       "0 Tk.",
              //       style: lightTextTheme.bodyMedium!.copyWith(
              //         color: appTheme.white,
              //       ),
              //     ),
              //   ],
              // ),
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
                    totalTest.toString(),
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
                    "$totalAmount Tk.",
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
                  onPressed: () {
                    context.pushNamed(BookingPatientInfoPage.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
