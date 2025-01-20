import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/app/bloc/his_patient_info_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_grid_list_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../patient_info.dart';

class BookingPatientInfoPage extends StatelessWidget {
  const BookingPatientInfoPage({super.key, required this.cartList});
  static const routeName = 'booking-patient-info-page';
  static const routePath = 'booking-patient-info-page';
  final List<ItemInfo> cartList;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HisPatientInfoBloc(getService()),
        ),
        BlocProvider(
          create: (context) => AddedPatUserListBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<PatientPortalUser>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<Gender>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<BloodGroup>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<DateTime>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<bool>()..update(false),
        ),
      ],
      child: BookingPatientInfoView(
        cartList: cartList,
      ),
    );
  }
}
