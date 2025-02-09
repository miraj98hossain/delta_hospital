import 'package:flutter/material.dart';

import 'profile_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const routeName = 'profile-page';
  static const routePath = 'profile-page';
  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}
