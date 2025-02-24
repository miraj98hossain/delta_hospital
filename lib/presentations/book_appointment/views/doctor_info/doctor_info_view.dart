import 'dart:convert';

import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/presentations/book_appointment/views/doctor_info/bloc/doctor_schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widgets/common_appbar.dart';
import '../../../../core/theme/app_theme.dart';
import 'bloc/doctor_info_bloc.dart';

class DoctorInfoView extends StatefulWidget {
  const DoctorInfoView({super.key, required this.doctor});
  final Doctor doctor;
  @override
  State<DoctorInfoView> createState() => _DoctorInfoViewState();
}

class _DoctorInfoViewState extends State<DoctorInfoView> {
  @override
  void initState() {
    context
        .read<DoctorInfoBloc>()
        .add(GetDoctorInfoEvent(doctorNo: widget.doctor.doctorNo ?? 0));
    context.read<DoctorScheduleBloc>().add(GetDoctorScheduleEvent(
        doctorNo: widget.doctor.doctorNo ?? 0,
        scheduleDate: DateTime.now().toFormatedString('yyyy-MM-dd')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppbar(),
      body: Container(
        color: appTheme.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: appTheme.black,
                image: widget.doctor.photo != null
                    ? DecorationImage(
                        fit: BoxFit.fill,
                        image: MemoryImage(
                          base64Decode(widget.doctor.photo ?? ""),
                        ),
                      )
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctor.doctorName ?? "",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: appTheme.primary,
                          ),
                        ),
                        Text(
                          widget.doctor.docDegree ?? "",
                          style: lightTextTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: appTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<DoctorScheduleBloc, DoctorScheduleState>(
              builder: (context, state) {
                if (state is DoctorScheduleSuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Schedule",
                          style: lightTextTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: appTheme.primary,
                          ),
                        ),
                        ...List.generate(
                          state.doctorScheduleList.length,
                          (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    state.doctorScheduleList[index]
                                            .scheduleDay ??
                                        "",
                                    style: lightTextTheme.bodyMedium),
                                Text(
                                  state.doctorScheduleList[index]
                                          .scheduleTime ??
                                      "",
                                  style: lightTextTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
