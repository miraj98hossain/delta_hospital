import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_type_list_response.dart';
import 'package:delta_hospital/features/items_booking/views/item_list/bloc/item_type_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../item_list.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});
  static const routeName = 'item-list-page';
  static const routePath = '/item-list-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemTypeBloc(getService()),
        ),
        BlocProvider(
          create: (context) => VariableStateCubit<ItemType>(),
        ),
      ],
      child: const ItemListView(),
    );
  }
}
