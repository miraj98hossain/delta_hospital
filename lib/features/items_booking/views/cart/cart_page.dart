import 'package:delta_hospital/features/items_booking/views/item_list/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.cartContext});
  static const routeName = 'cart-page';
  static const routePath = 'cart-page';
  final BuildContext cartContext;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CartBloc>(cartContext),
      child: const CartView(),
    );
  }
}
