import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirectorNoticeView extends StatefulWidget {
  const DirectorNoticeView({super.key});

  @override
  State<DirectorNoticeView> createState() => _DirectorNoticeViewState();
}

class _DirectorNoticeViewState extends State<DirectorNoticeView>
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
          horizontal: 15,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_sharp,
                  color: appTheme.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Notification",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: appTheme.white,
                  ),
                ),
              ],
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
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: index == 0 ? appTheme.deltaBlue : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Notification",
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
                          "Notice Board",
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
                  Container(
                    color: appTheme.white,
                  ),
                  Container(
                    color: appTheme.white,
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
