import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyAppointmentView extends StatefulWidget {
  const MyAppointmentView({super.key});

  @override
  State<MyAppointmentView> createState() => _MyAppointmentViewState();
}

class _MyAppointmentViewState extends State<MyAppointmentView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        color: index == 0 ? appTheme.deltaBlue : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Booked",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: index == 0
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
                        color: index == 1 ? appTheme.deltaBlue : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Completed ",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: index == 1
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
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: appTheme.primary,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.notifications_none_outlined,
                                        color: appTheme.primary,
                                      ),
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
                                          "Lorem Ipsum is simply dummy",
                                          style: lightTextTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: appTheme.black,
                                          ),
                                        ),
                                        Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
                                          style: lightTextTheme.bodySmall!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: appTheme.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
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
