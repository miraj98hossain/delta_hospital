import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';

import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal/patient_portal_page.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal_login/pat_portal_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FamilyListView extends StatefulWidget {
  const FamilyListView({super.key});

  @override
  State<FamilyListView> createState() => _FamilyListViewState();
}

class _FamilyListViewState extends State<FamilyListView> {
  late AppUserDetails loggedAppUser;
  @override
  void initState() {
    loggedAppUser = context.read<LoggedAppUserCubit>().state!;
    context.read<AddedPatUserListBloc>().add(GetAddedPatUserListEvent(
          refId: loggedAppUser.phone ?? '0',
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<AddedPatUserListBloc, AddedPatUserListState>(
                builder: (context, state) {
                  if (state is AddedPatUserListLoading) {
                    return const CommonLoading();
                  }
                  if (state is AddedPatUserListSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: state.patientPortalUserList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        var data = state.patientPortalUserList[index];
                        return PatientWidget(data: data);
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewPadding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}

class PatientWidget extends StatelessWidget {
  const PatientWidget({
    super.key,
    required this.data,
  });

  final PatientPortalUser data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var loggedHisUser = context.read<LoggedHisUserCubit>().state;
        if (loggedHisUser != null &&
            loggedHisUser.jobTile == "Patient" &&
            loggedHisUser.userName == data.mrn) {
          context.pushNamed(PatientPortalPage.routeName);
        } else {
          context.pushNamed(PatPortalLoginPage.routeName, queryParameters: {
            'mrn': data.mrn ?? '',
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.white,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      decoration: BoxDecoration(
                        color:
                            context.watch<LoggedHisUserCubit>().state != null &&
                                    context
                                            .watch<LoggedHisUserCubit>()
                                            .state!
                                            .userName ==
                                        data.mrn
                                ? Colors.green.shade400
                                : appTheme.secondary,
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(3),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data.firstName ?? ""),
                                        Text(data.relationship ?? ""),
                                      ],
                                    ),
                                  ),
                                  IconButton.filled(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
