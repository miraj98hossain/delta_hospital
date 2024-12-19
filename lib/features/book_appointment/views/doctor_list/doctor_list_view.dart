import 'dart:convert';

import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/book_appointment/book_appointment.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_sepcialization_list_response.dart';
import 'package:delta_hospital/features/book_appointment/views/doctor_list/bloc/department_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/doctor_list/bloc/online_doctor_grid_bloc.dart';
import 'package:delta_hospital/features/book_appointment/views/doctor_list/bloc/specialization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/cubit/variable_state_cubit.dart';
import '../../../../app/widgets/common_loading.dart';
import '../../../../app/widgets/common_text_field_widget.dart';

class DoctorListView extends StatefulWidget {
  const DoctorListView({super.key});

  @override
  State<DoctorListView> createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> {
  final _doclistScrollController = ScrollController();
  late TextEditingController _searchController;
  @override
  void initState() {
    context.read<DepartmentBloc>().add(GetDepartmentEvent());
    context.read<SpecializationBloc>().add(GetSpecializationEvent());
    context.read<OnlineDoctorGridBloc>().add(GetOnlineDoctorGridEvent());
    _searchController = TextEditingController();
    _doclistScrollController.addListener(() {
      if (_doclistScrollController.position.pixels ==
          _doclistScrollController.position.maxScrollExtent) {
        _fetchDoctorList();
        var length = context.read<VariableStateCubit<int>>().state!;
        context.read<VariableStateCubit<int>>().update(length + 10);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _doclistScrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _fetchDoctorList() {
    var selectedDepartment =
        context.read<VariableStateCubit<Department>>().state;
    var selectedSpecialization =
        context.read<VariableStateCubit<Specialization>>().state;
    var length = context.read<VariableStateCubit<int>>().state!;
    context.read<OnlineDoctorGridBloc>().add(
          GetOnlineDoctorGridEvent(
            length: length,
            searchValue: _searchController.text,
            departmentNo: selectedDepartment?.id,
            specializationNo: selectedSpecialization?.id,
          ),
        );
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
            CommonTextFieldWidget(
              controller: _searchController,
              onChanged: (value) {
                context.read<VariableStateCubit<int>>().update(10);
                _fetchDoctorList();
              },
              hintText: "Search",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<DepartmentBloc, DepartmentState>(
                    builder: (context, state) {
                      return CommonDropdownButton<Department>(
                        hintText: "Select Department",
                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<VariableStateCubit<Department>>()
                                .update(value);
                            context.read<VariableStateCubit<int>>().update(10);
                            _fetchDoctorList();
                          }
                        },
                        items: state is DepartmentSuccess ? state.deptList : [],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BlocBuilder<SpecializationBloc, SpecializationState>(
                    builder: (context, state) {
                      return CommonDropdownButton<Specialization>(
                        hintText: "Select Specialization",
                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<VariableStateCubit<Specialization>>()
                                .update(value);
                            context.read<VariableStateCubit<int>>().update(10);
                            _fetchDoctorList();
                          }
                        },
                        items: state is SpecializationSuccess
                            ? state.specList
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
            // BlocBuilder<OnlineDoctorGridBloc, OnlineDoctorGridState>(
            //   builder: (context, state) {
            //     return Row(
            //       children: [
            //         Container(
            //           height: 40,
            //           decoration: BoxDecoration(
            //             color: appTheme.white,
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Row(
            //             children: [
            //               Text(state is OnlineDoctorGridSuccess
            //                   ? state.doctorGridList.data?.length.toString() ??
            //                       "0"
            //                   : "0"),
            //               const Text("/"),
            //               Text(state is OnlineDoctorGridSuccess
            //                   ? state.doctorGridList.recordsTotal ?? "0"
            //                   : "0"),
            //             ],
            //           ),
            //         )
            //       ],
            //     );
            //   },
            // ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<OnlineDoctorGridBloc, OnlineDoctorGridState>(
                builder: (context, state) {
                  if (state.isLoading && state.doctorGridList.data == null) {
                    return const CommonLoading();
                  }
                  if (state.doctorGridList.data != null) {
                    return CustomScrollView(
                      controller: _doclistScrollController,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: state.doctorGridList.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            var doctor = state.doctorGridList.data?[index];

                            return Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        clipBehavior: Clip.antiAlias,
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: appTheme.primary,
                                          image: doctor?.photo != null
                                              ? DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: MemoryImage(
                                                    base64Decode(
                                                        doctor?.photo ?? ""),
                                                  ),
                                                )
                                              : null,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              doctor?.doctorName ?? "",
                                              style: lightTextTheme.bodyMedium!
                                                  .copyWith(),
                                            ),
                                            Text(
                                              doctor?.docDegree ?? "",
                                              style: lightTextTheme.bodySmall!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonElevatedButton(
                                          lable: "Book Appointment",
                                          onPressed: () {
                                            context.pushNamed(
                                                BookAppointmentPage.routeName);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: CommonElevatedButton(
                                          backgroundColor: appTheme.secondary,
                                          lable: "View Profile",
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        if (state.isLoading)
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 64,
                              child: CommonLoading(),
                            ),
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            )
            // Expanded(
            //   child: BlocBuilder<OnlineDoctorGridBloc, OnlineDoctorGridState>(
            //     builder: (context, state) {
            //       return ListView.separated(
            //         separatorBuilder: (context, index) => const SizedBox(
            //           height: 10,
            //         ),
            //         itemCount: state is OnlineDoctorGridSuccess
            //             ? state.doctorGridList.data?.length ?? 0
            //             : 0,
            //         itemBuilder: (context, index) {
            //           return Container(
            //             padding: const EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.grey.shade200,
            //             ),
            //             child: Column(
            //               children: [
            //                 Row(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Container(
            //                       height: 60,
            //                       width: 60,
            //                       decoration: BoxDecoration(
            //                         shape: BoxShape.circle,
            //                         color: appTheme.primary,
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Expanded(
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             "Dr. John Doe",
            //                             style: lightTextTheme.bodyMedium!
            //                                 .copyWith(),
            //                           ),
            //                           Text(
            //                             "Kidney Specialist",
            //                             style:
            //                                 lightTextTheme.bodySmall!.copyWith(
            //                               color: Colors.grey,
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 const SizedBox(
            //                   height: 10,
            //                 ),
            //                 Row(
            //                   children: [
            //                     Expanded(
            //                       child: CommonElevatedButton(
            //                         lable: "Book Appointment",
            //                         onPressed: () {
            //                           context.pushNamed(
            //                               BookAppointmentPage.routeName);
            //                         },
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Expanded(
            //                       child: CommonElevatedButton(
            //                         backgroundColor: appTheme.secondary,
            //                         lable: "View Profile",
            //                         onPressed: () {},
            //                       ),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
