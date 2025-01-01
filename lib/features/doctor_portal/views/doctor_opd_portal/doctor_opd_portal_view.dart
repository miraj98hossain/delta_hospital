import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/doctor_portal/data/models/doctor_shift_list_response.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorOpdPortalView extends StatefulWidget {
  const DoctorOpdPortalView({super.key, required this.shiftList});
  final List<Shift> shiftList;
  @override
  State<DoctorOpdPortalView> createState() => _DoctorOpdPortalViewState();
}

class _DoctorOpdPortalViewState extends State<DoctorOpdPortalView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.shiftList.length, vsync: this);
    _tabController.addListener(() {
      context.read<VariableStateCubit<int>>().update(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: appTheme.secondary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Appointment Date",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          BlocBuilder<VariableStateCubit<DateTime>, DateTime?>(
                            builder: (context, state) {
                              return Text(
                                context
                                        .watch<VariableStateCubit<DateTime>>()
                                        .state
                                        ?.toFormatedString("dd-MM-yyyy") ??
                                    "",
                                style: lightTextTheme.bodyMedium!.copyWith(
                                  color: appTheme.primary,
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              var date = context
                                  .read<VariableStateCubit<DateTime>>()
                                  .state;
                              var selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 30)),
                                initialDate: date,
                              );
                              if (selectedDate != null && context.mounted) {}
                            },
                            icon: Icon(
                              size: 20,
                              color: appTheme.primary,
                              Icons.calendar_today_outlined,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(),
                tabs: [
                  ...List.generate(widget.shiftList.length, (index) {
                    var shift = widget.shiftList[index];
                    return Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: index ==
                                  context
                                      .watch<VariableStateCubit<int>>()
                                      .state!
                              ? appTheme.deltaBlue
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            shift.shiftTime != null
                                ? shift.shiftTime!
                                    .replaceAll(
                                      RegExp(
                                        r'\([^)]*\)',
                                      ),
                                      "",
                                    )
                                    .trim()
                                : "",
                            style: lightTextTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: index ==
                                      context
                                          .watch<VariableStateCubit<int>>()
                                          .state!
                                  ? appTheme.white
                                  : appTheme.darkPurple,
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  ...List.generate(widget.shiftList.length, (index) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: appTheme.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lorem Ipsum is simply dummy",
                                      style: lightTextTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: appTheme.black,
                                      ),
                                    ),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
                                      style: lightTextTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: appTheme.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
