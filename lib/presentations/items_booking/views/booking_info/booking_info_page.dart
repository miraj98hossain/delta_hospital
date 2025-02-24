import 'package:delta_hospital/app/bloc/paymode_list_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/paymode_list_response.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/items_booking/data/models/booking_info_model.dart';
import 'package:delta_hospital/presentations/items_booking/views/booking_info/bloc/create_booking_bloc.dart';
import 'package:delta_hospital/presentations/items_booking/views/item_list/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../booking_info.dart';

class BookingInfoPage extends StatelessWidget {
  const BookingInfoPage({super.key, required this.bookingInfo});
  static const routeName = 'booking-info-page';
  static const routePath = 'booking-info-page';
  final BookingInfoModel bookingInfo;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaymodeListBloc(getService()),
        ),
        BlocProvider(
          create: (context) => CreateBookingBloc(getService()),
        ),
        BlocProvider(
          create: (context) => CartBloc(getService())..add(CartItemsGet()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Paymode>(),
        ),
      ],
      child: BookingInfoView(
        bookingInfo: bookingInfo,
      ),
    );
  }
}
