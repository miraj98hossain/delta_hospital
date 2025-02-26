import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';

import 'package:delta_hospital/app/widgets/common_appbar.dart';

import 'package:delta_hospital/core/theme/app_theme.dart';

import 'package:delta_hospital/presentations/hn_registration/views/hn_registration/widgets/reg_tab.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HnRegistrationView extends StatefulWidget {
  const HnRegistrationView({super.key});

  @override
  State<HnRegistrationView> createState() => _HnRegistrationViewState();
}

class _HnRegistrationViewState extends State<HnRegistrationView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      context.read<VariableStateCubit<int>>().update(_tabController.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration(),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            context.watch<VariableStateCubit<int>>().state == 0
                                ? appTheme.deltaBlue
                                : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Registration",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context
                                        .watch<VariableStateCubit<int>>()
                                        .state ==
                                    0
                                ? appTheme.white
                                : appTheme.darkPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            context.watch<VariableStateCubit<int>>().state == 1
                                ? appTheme.deltaBlue
                                : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Hn Cards",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context
                                        .watch<VariableStateCubit<int>>()
                                        .state ==
                                    1
                                ? appTheme.white
                                : appTheme.darkPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  const RegTab(),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today_outlined,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "30 Nov 2023",
                                            style: lightTextTheme.bodySmall!
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person_2_outlined,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "John Doe",
                                            style: lightTextTheme.bodySmall!
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
