import 'package:flutter/material.dart';
import '../../director_notice.dart';

class DirectorNoticePage extends StatelessWidget {
  const DirectorNoticePage({super.key});
  static const String routeName = "director-notice-page";
  static const String routePath = "director-notice-page";
  @override
  Widget build(BuildContext context) {
    return const DirectorNoticeView();
  }
}
