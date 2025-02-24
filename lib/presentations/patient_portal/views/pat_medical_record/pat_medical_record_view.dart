import 'package:delta_hospital/app/app.dart';

import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/app_modal.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_medical_record/pat_medical_record_page.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_medical_record/widgets/report_widget.dart';
import 'package:delta_hospital/presentations/patient_portal/views/patient_portal/patient_portal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/report_bloc.dart';

class PatMedicalRecordView extends StatefulWidget {
  const PatMedicalRecordView({super.key});

  @override
  State<PatMedicalRecordView> createState() => _PatMedicalRecordViewState();
}

class _PatMedicalRecordViewState extends State<PatMedicalRecordView> {
  @override
  void initState() {
    context.read<ReportBloc>().add(GetReportEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: BlocListener<LoggedHisUserCubit, UserDetails?>(
        listener: (context, state) {
          var activePage = GoRouterState.of(context).name.toString();
          if (state == null && activePage == PatMedicalRecordPage.routeName) {
            AppModal.showCustomModal(
              context,
              title: "Session Expired",
              content: const SessionExpireDialog(),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Medical Records->",
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<ReportBloc, ReportState>(
                  builder: (context, state) {
                    if (state is ReportLoading) {
                      return const CommonLoading();
                    }
                    if (state is ReportSuccess) {
                      return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: state.reportGridList.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            var data = state.reportGridList.data?[index];
                            return ReportWidget(data: data);
                          });
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
