import 'package:delta_hospital/data/models/lookup_response.dart';
import 'package:flutter/material.dart';

import 'package_details_view.dart';

class PackageDetailsPage extends StatelessWidget {
  const PackageDetailsPage({super.key, required this.lookUpDetails});
  static const routeName = 'package-details-page';
  static const routePath = 'package-details-page';
  final LookUpDetails lookUpDetails;
  @override
  Widget build(BuildContext context) {
    return PackageDetailsView(
      lookUpDetails: lookUpDetails,
    );
  }
}
