import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/data/models/item_type_list_response.dart';
import 'package:delta_hospital/presentations/items_booking/views/item_list/bloc/cart_bloc.dart';
import 'package:delta_hospital/presentations/items_booking/views/item_list/bloc/item_list_grid_bloc.dart';
import 'package:delta_hospital/presentations/items_booking/views/item_list/bloc/item_type_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../item_list.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});
  static const routeName = 'item-list-page';
  static const routePath = 'item-list-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemTypeBloc(getService()),
        ),
        BlocProvider(
          create: (context) => ItemGridBloc(getService()),
        ),
        BlocProvider(
          create: (context) => CartBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<ItemType>(),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<int>()..update(10),
        ),
      ],
      child: const ItemListView(),
    );
  }
}
