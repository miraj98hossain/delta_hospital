import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/paymode_list_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/paymode_list_response.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/items_booking/data/models/booking_info_model.dart';
import 'package:delta_hospital/features/items_booking/item_list.dart';
import 'package:delta_hospital/features/items_booking/views/booking_info/bloc/create_booking_bloc.dart';
import 'package:delta_hospital/features/items_booking/views/item_list/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookingInfoView extends StatefulWidget {
  const BookingInfoView({super.key, required this.bookingInfo});
  final BookingInfoModel bookingInfo;
  @override
  State<BookingInfoView> createState() => _BookingInfoViewState();
}

class _BookingInfoViewState extends State<BookingInfoView> {
  @override
  void initState() {
    context.read<PaymodeListBloc>().add(
          PaymodeListGet(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: BlocListener<CreateBookingBloc, CreateBookingState>(
        listener: (context, state) {
          if (state is CreateBookingSuccess) {
            context.read<CartBloc>().add(CartClear());
            showModalBottomSheet(
              context: context,
              isDismissible: false,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You have successfully booked.",
                        overflow: TextOverflow.ellipsis,
                        style: lightTextTheme.bodyMedium!.copyWith(
                          color: appTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CommonElevatedButton(
                          lable: "Okay",
                          onPressed: () {
                            context.goNamed(
                              ItemListPage.routeName,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
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
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appTheme.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: lightTextTheme.bodyMedium!.copyWith(),
                    ),
                    Text(
                      widget.bookingInfo.patientName ?? "",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        color: appTheme.primary,
                      ),
                    ),
                    Text(
                      "Payable Amount",
                      style: lightTextTheme.bodyMedium!.copyWith(),
                    ),
                    Text(
                      widget.bookingInfo.totalAmt?.toString() ?? "",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        color: appTheme.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Select Payment Method",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<PaymodeListBloc, PaymodeListState>(
                builder: (context, state) {
                  return CommonDropdownButton<Paymode>(
                    hintText: "Select Payment Method",
                    value: context.watch<VariableStateCubit<Paymode>>().state,
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<VariableStateCubit<Paymode>>()
                            .update(value);
                      }
                    },
                    items: state is PaymodeListSuccess ? state.paymodeList : [],
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<CreateBookingBloc, CreateBookingState>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.center,
                    child: CommonElevatedButton(
                      lable: state is CreateBookingLoading
                          ? "Please Wait..."
                          : "Proceed",
                      backgroundColor: appTheme.secondary,
                      onPressed: () {
                        if (context.read<VariableStateCubit<Paymode>>().state !=
                            null) {
                          context.read<CreateBookingBloc>().add(
                                CreateBooking(
                                  bookingInfoModel: widget.bookingInfo,
                                ),
                              );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
