import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/book_appointment/book_appointment.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';
import 'package:delta_hospital/features/book_appointment/views/doctor_list/bloc/department_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/cubit/variable_state_cubit.dart';
import '../../../../app/widgets/common_text_field_widget.dart';

class DoctorListView extends StatefulWidget {
  const DoctorListView({super.key});

  @override
  State<DoctorListView> createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> {
  @override
  void initState() {
    context.read<DepartmentBloc>().add(GetDepartmentEvent());
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
            const CommonTextFieldWidget(
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
                          }
                        },
                        items: state is DepartmentSuccess ? state.deptList : [],
                        validator: (value) {
                          if (value == null) {
                            return "Select Department";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CommonDropdownButton(
                    hintText: "Select Speciality",
                    onChanged: (value) {},
                    items: List.generate(20, (index) => index),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appTheme.primary,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. John Doe",
                                  style: lightTextTheme.bodyMedium!.copyWith(),
                                ),
                                Text(
                                  "Kidney Specialist",
                                  style: lightTextTheme.bodySmall!.copyWith(
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
                                context
                                    .pushNamed(BookAppointmentPage.routeName);
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
            ))
          ],
        ),
      ),
    );
  }
}
