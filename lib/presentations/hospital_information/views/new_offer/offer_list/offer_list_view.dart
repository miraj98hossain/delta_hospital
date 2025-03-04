import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/look_up_bloc.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/presentations/hospital_information/our_packages_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OfferListView extends StatefulWidget {
  const OfferListView({super.key});

  @override
  State<OfferListView> createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Active Offers",
              style: lightTextTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: appTheme.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: BlocBuilder<LookUpBloc, LookUpState>(
                builder: (context, state) {
                  if (state is LookUpLoading) {
                    return const CommonLoading();
                  }
                  if (state is LookUpSuccess) {
                    return ListView.separated(
                      itemCount: state.lookUpDetails.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(PackageDetailsPage.routeName,
                                extra: state.lookUpDetails[index]);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: appTheme.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: Text(
                                    state.lookUpDetails[index].lookupTitle ??
                                        "",
                                    style: lightTextTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: appTheme.secondary,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: appTheme.secondary,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
