import 'package:flutter/material.dart';
import '../../item_list.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});
  static const routeName = 'item-list-page';
  static const routePath = '/item-list-page';
  @override
  Widget build(BuildContext context) {
    return const ItemListView();
  }
}
