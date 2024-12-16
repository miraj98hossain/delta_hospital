import 'package:flutter/material.dart';
import '../../cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const routeName = 'cart-page';
  static const routePath = 'cart-page';
  @override
  Widget build(BuildContext context) {
    return const CartView();
  }
}
