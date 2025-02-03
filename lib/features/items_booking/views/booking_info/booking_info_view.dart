import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/paymode_list_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/paymode_list_response.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/items_booking/data/models/booking_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Container(
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
                      context.read<VariableStateCubit<Paymode>>().update(value);
                    }
                  },
                  items: state is PaymodeListSuccess ? state.paymodeList : [],
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: CommonElevatedButton(
                lable: "Proceed",
                backgroundColor: appTheme.secondary,
                onPressed: () {
                  if (context.read<VariableStateCubit<Paymode>>().state !=
                      null) {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
