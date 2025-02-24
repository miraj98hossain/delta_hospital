import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/data/models/app_login_response.dart';
import 'package:delta_hospital/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late AppUserDetails loggedAppUser;
  late TextEditingController _searchController;
  late FocusNode _searchFocusNode;
  @override
  void initState() {
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    loggedAppUser = context.read<LoggedAppUserCubit>().state!;
    context.read<AddedPatUserListBloc>().add(GetAddedPatUserListEvent(
          refId: loggedAppUser.phone ?? '0',
        ));
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

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
          children: [
            Text(
              'Make Payment',
              style: lightTextTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: appTheme.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Select Patient",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: appTheme.white,
                  ),
                ),
                SizedBox(
                  child:
                      BlocBuilder<AddedPatUserListBloc, AddedPatUserListState>(
                    builder: (context, state) {
                      return CommonDropdownButton<PatientPortalUser>(
                        hintText: "Select Patient",
                        value: context
                            .watch<VariableStateCubit<PatientPortalUser>>()
                            .state,
                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<VariableStateCubit<PatientPortalUser>>()
                                .update(value);
                          }
                        },
                        items: state is AddedPatUserListSuccess
                            ? state.patientPortalUserList
                            : [],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SegmentedButton(
              style: SegmentedButton.styleFrom(
                backgroundColor: appTheme.primary,
                iconColor: appTheme.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rectangular shape
                ),
                selectedBackgroundColor: appTheme.secondary,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.maximumDensity,
                ),
              ),
              segments: SegButton.values
                  .map(
                    (e) => ButtonSegment(
                      value: e,
                      label: Text(
                        e.value,
                        style: lightTextTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: appTheme.white,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              selected: <SegButton>{
                context.watch<VariableStateCubit<SegButton>>().state!
              },
              onSelectionChanged: (value) {
                context
                    .read<VariableStateCubit<SegButton>>()
                    .update(value.first);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CommonTextFieldWidget(
              controller: _searchController,
              focusNode: _searchFocusNode,
              onChanged: (value) {},
              hintText: "Search",
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 10,
                          children: [
                            Text(
                              "Invoice Type",
                              style: lightTextTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "OPD",
                              style: lightTextTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade300,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              Text(
                                "V2501317639",
                                style: lightTextTheme.bodySmall!.copyWith(),
                              ),
                              Text(
                                "13 May 2022",
                                style: lightTextTheme.bodySmall!.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Total(BDT)",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "5350.0",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 0.5,
                                thickness: 1,
                                color: appTheme.secondary,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Disc",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "0.0",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 0.5,
                                thickness: 1,
                                color: appTheme.secondary,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Paid",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "0.0",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 0.5,
                                thickness: 1,
                                color: appTheme.secondary,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Due",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "5350.0",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          spacing: 100,
                          children: [
                            Expanded(
                              child: CommonElevatedButton(
                                onPressed: () {},
                                backgroundColor: Colors.pink.shade600,
                                lable: "Unpaid",
                              ),
                            ),
                            Expanded(
                              child: CommonElevatedButton(
                                onPressed: () {},
                                backgroundColor: Colors.green.shade600,
                                lable: "Pay Now",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
