import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/data/models/lookup_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class OfferDetailsView extends StatefulWidget {
  const OfferDetailsView({super.key, required this.lookUpDetails});
  final LookUpDetails lookUpDetails;
  @override
  State<OfferDetailsView> createState() => _OfferDetailsViewState();
}

class _OfferDetailsViewState extends State<OfferDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            spacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Short Description",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appTheme.secondary,
                      ),
                    ),
                    Text(
                      widget.lookUpDetails.shortDescription ?? "",
                      style: lightTextTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: appTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Long Description",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appTheme.secondary,
                      ),
                    ),
                    HtmlWidget(
                      widget.lookUpDetails.lookupDescription ?? "",
                      textStyle: lightTextTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
