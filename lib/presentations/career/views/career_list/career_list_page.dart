import 'package:flutter/material.dart';

import 'career_list_view.dart';

class CareerListPage extends StatelessWidget {
  const CareerListPage({super.key});
  static const routeName = 'career-list-page';
  static const routePath = 'career-list-page';
  @override
  Widget build(BuildContext context) {
    return const CareerListView();
  }
}
