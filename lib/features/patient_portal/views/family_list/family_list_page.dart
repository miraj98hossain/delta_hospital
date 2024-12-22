import 'package:flutter/material.dart';

import '../../family_list.dart';

class FamilyListPage extends StatelessWidget {
  const FamilyListPage({super.key});
  static const String routeName = 'family-list-page';
  static const String routePath = 'family-list-page';
  @override
  Widget build(BuildContext context) {
    return const FamilyListView();
  }
}
