import 'package:delta_hospital/data/models/lookup_response.dart';
import 'package:flutter/material.dart';

import 'career_details_view.dart';

class CareerDetailsPage extends StatelessWidget {
  const CareerDetailsPage({super.key, required this.lookUpDetails});
  static const routeName = 'career-details-page';
  static const routePath = 'career-details-page';
  final LookUpDetails lookUpDetails;
  @override
  Widget build(BuildContext context) {
    return CareerDetailsView(
      lookUpDetails: lookUpDetails,
    );
  }
}
