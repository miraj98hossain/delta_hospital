import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/items_booking/views/item_list/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });
  static const routeName = 'cart-page';
  static const routePath = 'cart-page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(getService())..add(CartItemsGet()),
      child: const CartView(),
    );
  }
}
