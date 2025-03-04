import 'package:delta_hospital/data/models/lookup_response.dart';
import 'package:flutter/material.dart';

import 'offer_details_view.dart';

class OfferDetailsPage extends StatelessWidget {
  const OfferDetailsPage({super.key, required this.lookUpDetails});
  static const routeName = 'offer-details-page';
  static const routePath = 'offer-details-page';
  final LookUpDetails lookUpDetails;
  @override
  Widget build(BuildContext context) {
    return OfferDetailsView(
      lookUpDetails: lookUpDetails,
    );
  }
}
